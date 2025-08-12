# 🏢 Projeto criação de database, procedures, views, permissões e triggers de uma companhia

![Modelo do Banco de Dados](img/banco%20de%20dados%20img.png)


## 🎯 Objetivos

Este projeto simula a **modelagem e análise de dados de uma empresa** utilizando **MySQL**, com foco em:

- **Otimização de consultas** por meio de índices bem planejados.  
- **Procedures reutilizáveis** para operações repetitivas.  
- **Views** para simplificar consultas e fornecer visões estratégicas de negócio.  
- **Permissões** para controlar o acesso a informações sensíveis.  
- **Triggers** para manter a integridade e automatizar regras de negócio.

O projeto cobre desde a **criação das tabelas** até a **análise de dados com SQL avançado**, integrando práticas de segurança, desempenho e governança.

## 📁 Estrutura do Repositório

Projeto_criacao_database_procedures_compania_completo_SQL_MySQL/

├── README.md  
├── Script criação das tabelas.sql  
├── Script inserção de dados.sql  
├── Script análise de dados e criação de procedures.sql  
├── Views e permissões.sql 
├── Criação de triggers.sql

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

## 🔍 Views Criadas

As **views** centralizam informações e simplificam consultas frequentes:

- **Quantidade de empregados por departamento e localidade** — análise da distribuição de pessoal.  
- **Departamentos e seus gerentes** — visão clara da liderança.  
- **Projetos e seus funcionários** — priorização e alocação de recursos.  
- **Projetos e seus departamentos e gerentes** — visão consolidada da relação entre setores e projetos.  
- **Empregados com dependentes e se são gerentes** — apoio em gestão de benefícios e recursos humanos.

Essas views também servem como camada de abstração para controlar o acesso a dados sensíveis.

## 🔑 Controle de Permissões

O controle de acesso foi estruturado para garantir **segurança e conformidade**:

- **Usuário Gerente**:  
  - Pode consultar todas as views estratégicas.  
  - Acesso ampliado para análise organizacional.

- **Usuário Funcionário**:  
  - Acesso restrito a informações públicas, como lista de projetos mais populares.  

As permissões são aplicadas diretamente sobre as **views**, evitando exposição das tabelas originais.

## ⚙️ Triggers Implementados

Os **triggers** reforçam regras de negócio e protegem os dados:

1. **Auditoria de inserção de empregados** — gravação automática em tabela de auditoria ao cadastrar novos funcionários.  
2. **Prevenção de exclusão de empregados com dependentes** — impede perda de registros importantes.  
3. **Validação de departamento existente** — bloqueia inserções inválidas que referenciem departamentos inexistentes.

Esses gatilhos atuam **no momento da transação**, prevenindo erros antes que cheguem ao banco.

## 📌 Fluxo do Projeto

1. Criação das tabelas com chaves primárias, estrangeiras e restrições de integridade.  
2. Implementação de índices para melhorar a performance.  
3. Desenvolvimento de procedures para operações recorrentes.  
4. Criação das **views** para consultas estratégicas.  
5. Configuração de permissões para diferentes tipos de usuários.  
6. Implementação de **triggers** para auditoria e validação.  

## ✅ Benefícios

- **Segurança de dados** via controle de permissões.  
- **Integridade garantida** por constraints e triggers.  
- **Facilidade de análise** com views otimizadas.  
- **Reuso de código** com procedures.  
- **Alto desempenho** por meio de índices estratégicos.  
- **Escalabilidade** e facilidade de manutenção.
- 
## 📎 Considerações Finais

Este projeto une **boas práticas de modelagem, segurança, desempenho e governança** em banco de dados MySQL.  
Ele é aplicável tanto para fins acadêmicos quanto para uso como base em sistemas empresariais reais.


## Tecnologias Utilizadas

- SQL
- MySQL 
