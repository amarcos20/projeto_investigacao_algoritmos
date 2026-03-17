rule all:
    input:
        "resultado_workshop.txt"

rule download_sequences:
    output:
        v1 = "zika_ref.fasta",
        v2 = "zika_brazil.fasta"
    shell:
        # Sequências curtas do Zika (Uganda vs Brasil)
        "efetch -db nuccore -format fasta -id NC_045512.2 > {output.v1} && "
        "efetch -db nuccore -format fasta -id OM095411.1 > {output.v2}"

rule compare_all_kmers:
    input:
        v1 = "zika_ref.fasta",
        v2 = "zika_brazil.fasta"
    output:
        res = "resultado_workshop.txt"
    run:
        from Bio import SeqIO
        
        def hammingDistance(seq1, seq2):
            min_len = min(len(seq1), len(seq2))
            nmr = 0
            for i in range(min_len):
                if seq1[i] != seq2[i]:
                    nmr += 1
            return nmr + abs(len(seq1) - len(seq2))

        def editDistanceMemo(seq1, seq2, memo=None):
            if memo is None: memo = {}
            state = (len(seq1), len(seq2))
            if state in memo: return memo[state]
            if len(seq1) == 0: return len(seq2)
            if len(seq2) == 0: return len(seq1)
            if seq1[-1] == seq2[-1]:
                res = editDistanceMemo(seq1[:-1], seq2[:-1], memo)
            else:
                res = 1 + min(editDistanceMemo(seq1, seq2[:-1], memo),
                             editDistanceMemo(seq1[:-1], seq2, memo),
                             editDistanceMemo(seq1[:-1], seq2[:-1], memo))
            memo[state] = res
            return res

        s1 = str(SeqIO.read(input.v1, "fasta").seq)
        s2 = str(SeqIO.read(input.v2, "fasta").seq)

        k = 500 
        dist_edit = 0
        dist_ham = 0
        
        for i in range(0, max(len(s1), len(s2)), k):
            win1 = s1[i : i+k]
            win2 = s2[i : i+k]
            
            if win1 and win2:
                tamanho_comum = min(len(win1), len(win2))
                dist_ham += hammingDistance(win1[:tamanho_comum], win2[:tamanho_comum])
                dist_edit += editDistanceMemo(win1, win2)
            else:
                dist_edit += max(len(win1), len(win2))
                dist_ham += max(len(win1), len(win2))

        with open(output.res, "w") as f:
            f.write(f"DISTANCIA GENOMA COMPLETO (K={k})\n")
            f.write(f"Hamming Total: {dist_ham}\n")
            f.write(f"Edit Total: {dist_edit}\n")