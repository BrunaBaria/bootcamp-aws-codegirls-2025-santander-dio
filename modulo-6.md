# Armazenamento e Distribuição de Conteúdo na AWS

## 1. Introdução ao Amazon S3
O **Amazon S3 (Simple Storage Service)** é um serviço de **armazenamento de objetos** altamente escalável e durável.  
Na AWS, o equivalente ao conceito de *Blob* no Azure é chamado de **Bucket**.

### Classes de Armazenamento
- **S3 Standard:** maior custo, recuperação imediata.  
- **S3 Intelligent-Tiering:** ajusta automaticamente a classe de acordo com o padrão de acesso.  
- **S3 Glacier:** menor custo, recuperação mais lenta, tempo mínimo de armazenamento de 90 dias.  
- **S3 Glacier Deep Archive:** opção mais barata, com tempo mínimo de retenção de 180 dias.  

### Segurança
- **AWS KMS (Key Management Service):** serviço para gerenciamento e criptografia de chaves, funcionando como o "cofre" de dados da AWS.  

---

## 2. Amazon S3 Glacier
O **Amazon S3 Glacier** é utilizado para arquivar conteúdo que não é acessado com frequência (sem acesso superior a 5 dias).  

### Boas Práticas
- Configurar **políticas de ciclo de vida** para mover dados automaticamente para o Glacier após determinado período de inatividade.  

### Transferência em Grande Escala
- **AWS Snowball, Snowball Edge e Snowmobile**: soluções para transferência física de dados em larga escala (até petabytes).  
  - O **Snowmobile**, por exemplo, é um datacenter portátil para movimentar grandes volumes de dados de forma manual.  

---

## 3. Amazon CloudFront
O **Amazon CloudFront** é o serviço de **CDN (Content Delivery Network)** da AWS.  

### Funcionamento
- Atua como um **cache distribuído**, armazenando cópias de conteúdo estático em **pontos de presença (edge locations)** espalhados pelo mundo.  
- O objetivo é reduzir a latência e melhorar a experiência do usuário, entregando os dados a partir do local mais próximo ao cliente final.  
