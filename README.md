# Desafio 1 - Bootcamp Santander Code Girls 2025

Este repositório contém a entrega do **primeiro desafio** do bootcamp, na etapa de estudos sobre **Gerenciamento de EC2 na AWS**.  

O objetivo foi **criar uma arquitetura simples no draw.io**, relacionando os componentes:  
- **S3 + Lambda** ou  
- **EC2 + EBS**
  
Optei por representar a **primeira opção (S3 + Lambda)**.  

---
## Fluxo da Solução

1. O usuário acessa seu dispositivo e **gera um relatório** de visitas e despesas em `.xlsx`;  
2. O relatório é **enviado pelo portal da empresa**;  
3. Um **HTTP request** aciona a **API no Application Gateway**;  
4. Após autorização, o documento é enviado para o **Amazon S3 Standard**;  
5. A chegada do arquivo no S3 **dispara uma trigger** que ativa uma **Lambda Function** (Python);  
6. O Lambda:  
   - Itera sobre o documento;  
   - Lê e valida os dados;  
   - Se os dados forem válidos → armazena no **DynamoDB**;  
7. Após a inserção no DynamoDB, uma nova **trigger ativa outra Lambda Function**;  
8. Essa segunda Lambda envia uma notificação via **SNS (Simple Notification Service)** para o usuário, com a mensagem:  
   > "Dados registrados com sucesso!"

---

## Tecnologias Utilizadas
- **Amazon S3** (armazenamento de relatórios)  
- **AWS Lambda** (processamento serverless)  
- **Amazon DynamoDB** (banco de dados NoSQL)  
- **Amazon SNS** (notificação por e-mail)  
- **Application Gateway** (exposição da API)  
- **draw.io** (modelagem da arquitetura)  
