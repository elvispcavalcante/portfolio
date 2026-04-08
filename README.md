# 👋 Portfólio Profissional — Elvis P.C.

> Analista de dados e desenvolvedor Python especializado em planilhas avançadas, automação de processos e monitoramento & avaliação de projetos.

[![Portfólio](https://img.shields.io/badge/🌐_Portfólio-Ver_Site-F5A623?style=for-the-badge)](https://elvispcavalcante.github.io/portfolio)
[![Workana](https://img.shields.io/badge/Workana-Ver_Perfil-2E5597?style=for-the-badge)](https://workana.com/freelancer/seulink)
[![Email](https://img.shields.io/badge/Email-Contato-595959?style=for-the-badge)](mailto:elvispc@epcsolucoes.dev.br)

---

## 🧑‍💻 Sobre mim

Profissional com experiência em **Monitoramento & Avaliação de projetos sociais**, análise de dados e desenvolvimento Python. Trabalho de forma 100% remota com entregas organizadas, comunicação clara e documentação incluída em todos os projetos.

**Principais competências:**

- 📊 Excel e Google Sheets avançados — dashboards, fórmulas complexas, automação com macros
- 🐍 Python para análise e automação — Pandas, Openpyxl, geração de relatórios
- 📈 Monitoramento & Avaliação (M&A) — indicadores, matrizes de resultados, semáforos de performance
- 🗂️ Organização e modelagem de dados — dicionário de dados, SQL, estruturação de bases

---

## 📁 Estrutura do Repositório

```
portifolio/
│
├── portfolio.html                           ← Site do portfólio (visualização interativa)
├── README.md
├── requirements.txt
│
└── projetos/
    ├── 01-dashboard-orcamentario/
    │   └── dashboard_orcamentario.xlsx
    ├── 02-automacao-relatorios/
    │   ├── gerar_relatorio.py
    │   ├── dados_mensais/
    │   │   └── dados_jan_mar_2025.xlsx      ← Dados de entrada (exemplo)
    │   └── relatorios_gerados/
    │       └── relatorio_202604_Abril.xlsx  ← Relatório gerado pelo script
    ├── 03-framework-ma/
    │   └── framework_monitoramento_avaliacao.xlsx
    └── 04-modelagem-dados/
        ├── modelagem_dados_projetos_sociais.xlsx
        └── schema.sql
```

---

## 🌐 Portfólio Interativo

O arquivo `portfolio.html` pode ser aberto diretamente no navegador (sem servidor). Cada card de projeto possui:

- **Projetos 1 e 3:** botão para baixar o arquivo Excel diretamente
- **Projeto 2:** botão para visualizar o código Python em um modal + download do script e do relatório gerado
- **Projeto 4:** botão para visualizar o schema SQL em um modal + download do SQL e do modelo Excel

> O código Python e SQL está embutido no HTML, então a visualização funciona normalmente via `file://`.

---

## 🗂️ Projetos

### 📊 01 — Dashboard de Controle Orçamentário

**Arquivo:** `projetos/01-dashboard-orcamentario/dashboard_orcamentario.xlsx`

Planilha Excel profissional para acompanhamento financeiro de projetos, com atualização automática de todos os indicadores a partir dos dados inseridos.

**O que está incluído:**
- Aba **Dashboard** com KPIs principais, tabela resumo mensal e dois gráficos automáticos (Receitas × Despesas e Evolução do Saldo)
- Aba **Dados** com estrutura organizada por categorias de despesa e receita, com totais e saldo calculados automaticamente por mês
- Aba **Instruções** com guia de uso passo a passo

**Tecnologias:** Microsoft Excel · Fórmulas avançadas (SUM, IFERROR, referências cruzadas) · Gráficos dinâmicos

---

### 🤖 02 — Automação de Relatórios com Python

**Arquivos:**
- `projetos/02-automacao-relatorios/gerar_relatorio.py` ← Script principal
- `projetos/02-automacao-relatorios/dados_mensais/dados_jan_mar_2025.xlsx` ← Dados de entrada (exemplo)
- `projetos/02-automacao-relatorios/relatorios_gerados/relatorio_202604_Abril.xlsx` ← Relatório gerado

Script Python que lê automaticamente todas as planilhas de uma pasta, consolida e limpa os dados, calcula métricas e gera um relatório Excel completo e formatado — em poucos segundos.

**Como executar:**
```bash
# Instalar dependências
pip install pandas openpyxl

# Coloque os arquivos .xlsx na pasta dados_mensais/
# Execute o script a partir da pasta do projeto
cd projetos/02-automacao-relatorios
python gerar_relatorio.py

# O relatório será gerado em relatorios_gerados/
```

**O relatório gerado contém:**
- Aba **Resumo Executivo** com KPIs (Total Receitas, Despesas, Saldo, Nº Registros)
- Aba **Por Categoria** com totais e percentuais por categoria
- Aba **Evolução Mensal** com tabela e gráfico de barras
- Aba **Dados Consolidados** com todos os registros processados

**Tecnologias:** Python 3 · Pandas · Openpyxl · Geração automática de Excel

> Meses e datas gerados em português do Brasil. Compatível com Windows (encoding UTF-8 configurado automaticamente).

---

### 📈 03 — Framework de Monitoramento & Avaliação

**Arquivo:** `projetos/03-framework-ma/framework_monitoramento_avaliacao.xlsx`

Sistema completo de M&A para projetos sociais, com matriz de resultados por nível lógico, painel de semáforo de performance e acompanhamento mensal de atividades.

**O que está incluído:**
- Aba **Matriz de Resultados** com indicadores organizados por nível (Impacto → Resultado → Produto → Atividade), meio de verificação, meta anual e realizado com cálculo automático de % alcance
- Aba **Painel de Indicadores** com semáforo visual (Verde/Amarelo/Vermelho), gráfico de barras por indicador e campo de observações
- Aba **Acompanhamento Mensal** com registro de atividades mês a mês e totais anuais automáticos

**Tecnologias:** Excel · Google Sheets compatível · Lógica de indicadores · M&A framework

---

### 🗃️ 04 — Modelagem de Dados para Sistema de Gestão

**Arquivos:**
- `projetos/04-modelagem-dados/modelagem_dados_projetos_sociais.xlsx` ← Dicionário e exemplos
- `projetos/04-modelagem-dados/schema.sql` ← Schema SQL completo

Modelagem relacional de um sistema de gestão de projetos sociais, com dicionário de dados documentado, dados de exemplo e schema SQL pronto para implementação.

**O que está incluído:**
- Aba **Dicionário de Dados** com 4 entidades (Beneficiários, Projetos, Atendimentos, Colaboradores) — campos, tipos, chaves primárias/estrangeiras e descrições
- Aba **Dados de Exemplo** com registros reais simulados da tabela de beneficiários
- Aba **Diagrama ER** com mapeamento dos relacionamentos entre entidades
- **Schema SQL** com tabelas, constraints, índices de performance e 3 views prontas para relatórios

**Tecnologias:** SQL (PostgreSQL / MySQL) · Modelagem relacional · Excel · Documentação técnica

---

## 🛠️ Tecnologias

![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoftexcel&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat&logo=pandas&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=postgresql&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google_Sheets-34A853?style=flat&logo=googlesheets&logoColor=white)

---

## 📬 Contato

Estou disponível para projetos freelance remotos. Entre em contato e receba uma proposta em até 24h após análise do escopo.

| Canal | Link |
|-------|------|
| ✉️ E-mail | [elvispc@epcsolucoes.dev.br](mailto:elvispc@epcsolucoes.dev.br) |
| 💬 WhatsApp | [Clique aqui](https://wa.me/5588999853824) |
| 🌐 Workana | [Ver perfil](https://workana.com/freelancer/seulink) |

---

<p align="center">
  Feito por Elvis P.C. · 2026
</p>
