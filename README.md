# 🏢 Projeto criação de database, procedures, views, permissões e triggers de uma companhia

![Diagrama do banco de dados](img/banco%20de%20dados%20img.png)

Este projeto simula a modelagem e análise de dados de uma empresa utilizando **MySQL**, com foco em **otimização de consultas** via **índices bem planejados** e **procedures reutilizáveis**. Ele cobre desde a criação das tabelas até a análise de dados com SQL avançado.

## 🎯 Objetivos

- Criar um banco de dados relacional completo com integridade referencial.
- Responder perguntas de negócio utilizando SQL com joins, agrupamentos e ordenações.
- Aplicar **índices estratégicos** para acelerar o desempenho das consultas.
- Automatizar relatórios com **stored procedures** reutilizáveis.

## 📁 Estrutura do Repositório

Projeto_criacao_database_procedures_compania_completo_SQL_MySQL/

├── README.md

├── Script criação das tabelas.sql

├── Script inserção de dados.sql

├── Script análise de dados e criação de procedures.sql

## 🧱 Estrutura do Banco de Dados

As tabelas modelam o ambiente de uma empresa realista com funcionários, departamentos, projetos e dependentes:

- `employee` – funcionários  
- `departament` – departamentos  
- `dept_locations` – cidades onde há departamentos  
- `project` – projetos ativos  
- `works_on` – associação de funcionários a projetos  
- `dependent` – dependentes dos funcionários

## 🧠 Consultas Baseadas em Perguntas Reais

- ✅ **Qual o departamento com maior número de funcionários?**
- ✅ **Quais são os departamentos presentes por cidade?**
- ✅ **Quais funcionários trabalham em quais departamentos?**

## Tecnologias Utilizadas

- SQL
- MySQL 
