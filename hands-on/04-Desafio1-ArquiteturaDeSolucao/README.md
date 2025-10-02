# Desafio 1 - Primeira Arquitetura de Solução com Draw.io

O desafio era criar uma arquitetura de solução com S3 + Lambda Function ou EC2 + EBS;
Eu optei por desenha uma solução de S3 + Lambda Function.

## Explicando o desenho

1) Os usuários devem enviar relatórios .xlsx na intranet da empresa, através de dispositivos;
2) Ao enviar um arquivo, o API Gateway recebe a requisição do site;
3) Que envia o arquivo para o armazenamento no S3;
4) Ao armazenar o arquivo, um gatilho aciona um Lambda Function que identifica se o arquivo é um.xlsx;
5) Se for um .xlsx, outro lambda lê os dados e envia para o banco de dados;
6) O Dynamo DB recebe e armazena os dados;
7) Ao finalizar, aciona um gatilho do Lambda Function para informar ao usuário;
8) Esse gatilho aciona um SNS para enviar a notificação para o email do usuário;
9) O usuário recebe a notificação de sucesso ou falha;
