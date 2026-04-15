# Workshop: Sequence Metrics & Similarity in SARS-CoV-2

Este repositório contém o material prático para o workshop de Bioinformática focado em **Métricas de Comparação de Sequências**. O objetivo é comparar variantes do SARS-CoV-2 utilizando algoritmos fundamentais de alinhamento e visualização genómica.

---

## Setup Local

```bash
# 1. Clonar o repositório
git clone https://github.com/amarcos20/projeto_investigacao_algoritmos.git

# 2. Entrar na pasta
cd projeto_investigacao_algoritmos

# 3. Instalar dependências
pip install numpy matplotlib
```


## Dados do Projeto

O workflow usa dois genomas completos reais do **NCBI GenBank**, já pré-alinhados.

| Ficheiro | Accession | Descrição |
|---|---|---|
| `SARS-CoV-2_ref_aln.fasta` | [NC_045512.2](https://www.ncbi.nlm.nih.gov/nuccore/NC_045512.2) | Wuhan-Hu-1 — estirpe de referência (2019) |
| `SARS-CoV-2_var_aln.fasta` | [MZ359844.1](https://www.ncbi.nlm.nih.gov/nuccore/MZ359844.1) | Variante Indiana Delta-like (2021) |

Os `-` nas sequências representam **gaps** — posições onde existe uma inserção/deleção relativamente à outra estirpe.

---

## Workflow do Notebook

```
FASTA alinhados
      ↓
 Passo 1 — Ler as sequências         →  read_fasta(...)
      ↓
 Passo 2 — Explorar o alinhamento    →  explore_alignment(...)
      ↓
 Passo 3 — Divergência por janelas   →  compare_distances_windowed(...)
      ↓
 Passo 4 — Visualizar                →  matplotlib (codigo dado - corre e analisa)
      ↓
 Passo 5 — Gráfico completo          →  (código dado — corre e analisa)
      ↓
 Passo 6 — Interpretação biológica
```

---



## Algoritmos Abordados

| Algoritmo | Descrição |
|---|---|
| **Identidade de sequência** | Contagem de matches/mismatches em alinhamento coluna a coluna |
| **Janela deslizante** | Divergência local ao longo do genoma em blocos de 1 000 bp |

---

## Motivação Biológica — Tópicos para Investigação

* *"Comparative genomics of SARS-CoV-2 variants: impact of point mutations and indels"*
* *"Sequence similarity metrics for viral evolution and surveillance"*
