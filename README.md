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
FASTA pré-alinhados
      ↓
 Exercício 1 — Ler as sequências (read_fasta)
      ↓
 Exercício 2 — Estatísticas globais do alinhamento (matches / mismatches / gaps)
      ↓
 Exercício 3 — Divergência por janelas de 1 000 bp  [código dado]
      ↓
 Exercício 4 — Gráfico de barras com região Spike assinalada
      ↓
 Exercício 5 — Interpretação biológica (3 perguntas)
```

---

## Exercícios a Completar (10 min)

### Exercício 1 — `read_fasta`
Implementar uma função que lê um ficheiro `.fasta` e devolve `(header, sequence)`.

### Exercício 2 — `explore_alignment`
Percorrer o alinhamento coluna a coluna e contar **matches**, **mismatches** e **gaps**. Calcular a identidade global (%).

### Exercício 4 — Gráfico de barras
Com os dados de divergência por janela já calculados, criar um `ax.bar(...)` com a posição no genoma em X e a divergência por bp em Y. Assinalar a região Spike a vermelho.

> O Exercício 3 (janelas deslizantes) e o gráfico final completo têm o código fornecido — basta correr.

---

## Perguntas de Interpretação

**Q1.** Qual é a identidade global entre os dois genomas? O que significa em termos evolutivos?

**Q2.** Olhando para o gráfico de barras, qual a região do genoma com maior divergência? Coincide com alguma região biologicamente relevante?

**Q3.** O sítio de clivagem por furina (~23 603 nt) está associado à mutação **P681R** na variante Delta. Porquê é que uma mutação neste sítio pode aumentar a infectividade do vírus?

---

## Algoritmos Abordados

| Algoritmo | Descrição |
|---|---|
| **Needleman-Wunsch** | Alinhamento global (aplicado no pré-processamento dos dados) |
| **Identidade de sequência** | Contagem de matches/mismatches em alinhamento coluna a coluna |
| **Janela deslizante** | Divergência local ao longo do genoma em blocos de 1 000 bp |

---

## Motivação Biológica — Tópicos para Investigação

* *"Comparative genomics of SARS-CoV-2 variants: impact of point mutations and indels"*
* *"Sequence similarity metrics for viral evolution and surveillance"*
* *"Furin cleavage site mutations and SARS-CoV-2 Delta variant transmissibility"*
