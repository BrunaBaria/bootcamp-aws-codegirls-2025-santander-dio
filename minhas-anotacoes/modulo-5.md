# Módulo 5 – Banco de Dados

## 1. Amazon RDS (Relational Database Service)

Serviço de **PaaS** para bancos relacionais, indicado quando há necessidade de **persistência de transações**.  
O RDS oferece suporte aos seguintes mecanismos de banco de dados:

- **MariaDB**  
  - Compatível com MySQL.  

- **Amazon Aurora**  
  - Código aberto.  
  - Compatível com MySQL e PostgreSQL.  
  - Até 5x mais rápido que o MySQL.  

- **Oracle**  
  - Permite usar licenças próprias ou pagar pelo uso na AWS.  
  - Solução robusta para ambientes corporativos.  

- **SQL Server**  
  - Suporte aos recursos nativos do SQL Server.  

- **PostgreSQL**  
  - Banco objeto-relacional de código aberto.  

- **MySQL**  
  - Banco relacional de código aberto.  
  - Menos robusto em comparação a outras opções.  

### Criação de um Banco no RDS (via Console AWS)
1. Acesse **RDS → Criar banco de dados**.  
2. Escolha o motor (ex.: Oracle Standard Edition Two → Dev/Test).  
3. Defina o identificador da instância (nome da instância).  
4. Defina o **nome do usuário** da instância.  
5. Gerencie credenciais com **AWS Secrets Manager**.  
6. (Opcional) Crie conexão com instância **EC2**.  
7. Conclua a criação.  

---

## 2. Amazon DynamoDB (NoSQL)

- Banco de dados **NoSQL**, voltado para dados **não estruturados** e **semiestruturados**.  
- Armazena em formato **JSON**.  
- É necessário **planejar índices** de forma antecipada.  
  - **Reindexar índices é caro** na AWS.  

### Hands-on com DynamoDB
- Instale o **AWS CLI**.  
- Comando `aws --version` exibe a versão instalada.  
- Comando `aws` (sem parâmetros) retorna o help (confirma instalação).  
- No console IAM:  
  - Crie um usuário.  
  - Adicione a um grupo com a política **AdministratorAccess**.  
- Defina chave de acesso no usuário e baixe a chave.  
- Configure no CLI:  
  - `aws configure` → informe **Access Key**, **Secret Key**, **região (us-east-1)** e **formato (json)**.  
- Crie uma pasta no computador com arquivos `.json`:  
  - Um para o **formato da tabela**.  
  - Outro para os **itens a serem adicionados**.  
- Utilize **PowerShell** para criar a tabela:  
  - Exemplo: `create-customers-table.ps1`.  
- Recomenda-se instalar a extensão AWS no VS Code para facilitar a integração.  

---

## 3. Estratégias de Backup e Recuperação de Dados

### Conceitos Básicos
- Backup é a **cópia dos dados**.  
- Toda estratégia deve considerar:  
  - Quais dados são críticos.  
  - **RPO (Recovery Point Objective):** ponto de recuperação.  
  - **RTO (Recovery Time Objective):** tempo de recuperação.  

### Serviços e Recursos de Backup
- **AWS Backup, S3, Snapshots.**  
- **Amazon RDS Automated Backups & Snapshots**: backups automáticos e snapshots para restauração pontual.  
- **Amazon DynamoDB On-Demand Backup (PITR):** backup sob demanda e contínuo para tabelas DynamoDB.  

### Boas Práticas
- Implementar política de **regularidade de backups**.  
- Realizar **testes de recuperação** periódicos.  
- Executar **backup drills** (simulações de desastre).  

### Segurança e Conformidade
- **Criptografia:**  
  - Em trânsito (TLS).  
  - Em repouso (S3 Server Encryption, RDS Encryption).  
- **Controle de acesso:** políticas que restringem acesso apenas a usuários autorizados.  
- **Auditoria:**  
  - Usar **AWS CloudTrail** para registrar acessos e atividades.  
  - Garantir conformidade com requisitos regulatórios.  
