# 🧬 Workshop: Sequence Metrics & Similarity in SARS-CoV-2

Este repositório contém o material prático e o código base para o workshop de Bioinformática focado em **Métricas de Comparação de Sequências**. O objetivo é capacitar os alunos a identificar variações genéticas entre estirpes virais utilizando algoritmos fundamentais.

---

##  Motivação Biológica

A comparação de sequências é o "pão com manteiga" da vigilância genómica. Ao analisar o genoma do SARS-CoV-2, que podem alterar a forma como o vírus entra nas células humanas ou como escapa aos anticorpos.

### Tópicos para Investigação (Google Scholar):
Para aprofundar o conhecimento teórico, sugere-se a pesquisa pelos seguintes termos:
* *“Comparative genomics of SARS-CoV-2 variants: impact of point mutations and indels”*
* *“Sequence similarity metrics for viral evolution and surveillance”*
* *“Dynamic programming in sequence alignment: Levenshtein vs Hamming”*
* *“Dot plot analysis for genomic structural variations”*

---

##  Instalação e Setup

Para correres o notebook e as análises, primeiro clona este repositório e instala as dependências:

```bash
# 1. Clonar o repositório
git clone [https://github.com/teu-utilizador/nome-do-repo.git](https://github.com/teu-utilizador/nome-do-repo.git)

# 2. Entrar na pasta
cd nome-do-repo

# 3. Instalar bibliotecas necessárias
pip install numpy pandas matplotlib biopython python-Levenshtein
```
##  Dados do Projeto (Inputs)

O workflow utiliza dois genomas inteiros reais extraídos do **NCBI GenBank**:

1.  **Referência (Wuhan-Hu-1):** [NC_045512.2](https://www.ncbi.nlm.nih.gov/nuccore/NC_045512.2) - O genoma original de 2019.
2.  **Variante (Delta Like):** [MZ359844.1](https://www.ncbi.nlm.nih.gov/nuccore/MZ359844.1) - Um isolado real com múltiplas mutações.

---

##  O "Puzzle" do Workflow (Atividade Prática)

O desafio para cada grupo é montar o fluxo de análise no Notebook e interpretar os resultados de **3 tentativas** (reads) diferentes.

### Passo-a-Passo:
1.  **Extração:** Usar a função `get_synced_reads` para obter fragmentos aleatórios dos dois genomas.
2.  **Cálculo Rígido:** Aplicar a `Hamming_Distance` para medir mutações pontuais.
3.  **Cálculo Flexível:** Aplicar a `edit_distance_dp` (Programação Dinâmica/Tabulação) para lidar com possíveis indels.
4.  **Visualização:** Gerar o `plot_dotplot` para identificar padrões visuais de similaridade.
5.  **Análise:** Comparar as métricas de `hammingSimilarity` e `editSimilarity`.

---

##  Interpretação de Resultados e Conclusão

Os grupos devem focar-se na interpretação biológica e técnica dos dados:

* **Identidade vs Similaridade:** Por que é que a distância de Hamming dá erro ou valores extremamente baixos em zonas com "gaps" (deleções/inserções)?
* **Padrões Visuais:** No Dot Plot, o que representa uma diagonal perfeitamente contínua versus uma diagonal com "saltos" ou quebras?
* **Eficiência Algorítmica:** Qual a diferença prática observada entre a solução recursiva com *Memoization* e a solução por *Tabulação* (Programação Dinâmica)?
* **Impacto Biológico:** Se a similaridade na zona da proteína Spike (posições ~21500-25400) for baixa, qual o impacto potencial na eficácia das vacinas?

---

##  Algoritmos Implementados no Notebook

O código base inclui implementações didáticas de:
* **Distância de Hamming:** Comparação exata posição a posição (exige comprimentos iguais).
* **Distância de Edição (Levenshtein):** * Versão Recursiva com **Memoization** (Otimização de memória).
    * Versão com **Programação Dinâmica (Tabulação)** usando matrizes NumPy/Pandas.
* **Dot Plot Visual:** Representação gráfica da matriz de similaridade binária.

---

**Nota:** Este workshop simula um ambiente de investigação real. Certifiquem-se de que os vossos resultados são reprodutíveis e documentem as vossas observações no final do Notebook! 