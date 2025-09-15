# Módulo 7) Serviços Intermediários e Avançados  

## 1) AWS Lambda
- O Lambda recebe a informação e repassa adiante.  
- Idealmente, não deve tomar decisões complexas de condições.  
- **Desafio prático:** criar uma função que acesse uma API externa (ex.: API de CEPs).  

---

## 2) Amazon ECS e EKS
### Microserviços
- São serviços independentes, partes separadas da solução.  

### ECS (Elastic Container Service)
- Serviço de **orquestração de contêineres**: executa, interrompe e gerencia contêineres em um cluster.  
- Fácil gerenciamento, automatização, escalabilidade automática.  
- Integração nativa com IAM, VPC, CloudWatch.  
- Possibilidade de aplicar roles e policies.  
- Ideal para execução de códigos com duração superior a 15 minutos.  

### ECR (Elastic Container Registry)
- Repositório de imagens de contêiner.  

### EKS (Elastic Kubernetes Service)
- Orquestrador de contêineres baseado no Kubernetes (desenvolvido pelo Google).  
- Kubernetes é open-source e atualmente um dos orquestradores mais populares do mercado.  
- AWS incorporou o Kubernetes (EKS) para atender demanda do mercado.  
- Azure possui o **AKS** (Azure Kubernetes Service) e o Google oferece o **GKE** (Google Kubernetes Engine).  
- **Função do Kubernetes Service:** ajustar dinamicamente o tamanho de clusters necessários para executar serviços.  
- Adequado para organizações que já utilizam Kubernetes e querem integrar com AWS.  
- Gestão do Kubernetes é considerada complexa.  

### ECS vs. EKS
- **ECS**
  - Orquestrado e gerenciado pela AWS.  
  - No back-end pode utilizar o **Fargate**.  
- **EKS**
  - Mais popular no mercado.  
  - Utiliza Kubernetes open-source do Google.  
  - Baseado em K8s para orquestração.  

---

## 3) Amazon SNS e SQS – Mensageria  

### SNS (Simple Notification Service)
- Serviço de mensagens assíncronas.  
- Modelo Publisher/Subscriber (publicador → assinante).  
- **Tópicos:** ponto de acesso entre Publisher e Subscriber.  
  - **FIFO (First-In, First-Out):** primeira mensagem que entra é a primeira que sai (limite de 300 publicações/segundo). Ex.: sistema financeiro.  
  - **Padrão:** mais flexível, não garante ordenação nem entrega única. Usado em sistemas baseados em eventos.  
- **Comunicação:** Pub/Sub (publicação/assinatura).  
- **Objetivo:** enviar mensagens para múltiplos destinatários ao mesmo tempo.  
- **Destinatários:** e-mail, SMS, Lambda, HTTP endpoints, filas SQS.  
- **Entrega:** Push (mensagem enviada diretamente).  
- **Casos de uso:** notificações em tempo real, alertas, integração com sistemas externos.  
- **Exemplo:** sistema de monitoramento envia alertas via SNS para e-mails, SMS e Lambda ao detectar problema.  

### SQS (Simple Queue Service)
- Serviço de filas para mensagens assíncronas.  
- Mensagens armazenadas até serem processadas.  
- **Objetivo:** desacoplar componentes de sistemas distribuídos.  
- **Destinatários:** consumidores que leem da fila (aplicações, workers).  
- **Entrega:** Pull (consumidor busca mensagens).  
- **Casos de uso:** processamento assíncrono, controle de carga, retry de tarefas.  
- **Exemplo:** pedidos de e-commerce em fila SQS para processamento no sistema de faturamento.  

### SNS + SQS Juntos
- SNS publica mensagens.  
- Uma ou mais filas SQS podem ser assinantes.  
- Combina broadcast (SNS) com processamento assíncrono (SQS).  

---

## 4) AWS Step Functions
- Orquestrador de serviços (equivalente ao **Data Factory** no Azure).  
- Interface **low-code** (drag-and-drop).  
- Baseado em arquitetura **serverless**.  

---