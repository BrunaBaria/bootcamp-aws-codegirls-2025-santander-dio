# Resumo de Conceitos AWS – Redes, DNS, CDN e Balanceamento

## 1. Amazon VPC

### a) Redes na AWS
- **VPC (Virtual Private Cloud):** rede lógica isolada dentro da AWS.  
- **Subnet:** sub-rede dentro da VPC, pode ser pública ou privada.  
- **Security Group:** contêiner lógico de regras de portas de acesso (inbound/outbound).  
- **Route 53:** serviço de DNS, traduz domínio para IP.  
- **CloudFront:** rede de distribuição de conteúdo.  
- **Elastic Load Balancer (ELB):** balanceador de carga.  

### b) O que é Amazon VPC?
- Rede lógica isolada, privada do cliente.  
- Serviços públicos não ficam dentro da VPC.  
- Serviços privados requerem VPC.  
- Lambda pode ser executado em modo público ou privado.  
- **Características principais da VPC:**  
  - Isolamento de rede (segurança para hospedagem de aplicações).  
  - Controle de tráfego (NSGs e ACLs).  
  - Suporte a sub-redes públicas e privadas.  
  - Controle de endereçamento de IP.  
  - Conectividade com VPNs ou conexões dedicadas.  

---

## 2. Amazon Subnet

- Subnet é um conjunto de IPs dentro da VPC.  
- É dentro da Subnet que são criados os recursos da AWS.  
- Cada Subnet deve residir inteiramente em uma zona de disponibilidade.  
- Security Groups podem ser atribuídos aos recursos dentro da Subnet.  

---

## 3. Amazon Security Group

- Security Group define as regras de acesso aos recursos.  
- É anexado à placa de rede da instância (proteção inbound/outbound).  
- Responsável por habilitar tipos de acesso como **SSH, RDP** e portas específicas.  

---

## 4. Amazon Route 53

### O que é?
Serviço de **DNS (Domain Name System)** altamente disponível e escalável da AWS.  

### Funcionalidades
- **DNS Gerenciado:** traduz nomes de domínio legíveis (ex.: `www.exemplo.com`) em IPs (ex.: `192.0.2.1`).  
- **Registros DNS suportados:** A, AAAA, CNAME, MX, TXT etc.  
- **Registro de Domínio:** comprar e gerenciar domínios diretamente pela AWS.  
- **Roteamento de Tráfego:**  
  - *Simple Routing:* envia tráfego para um único recurso.  
  - *Weighted Routing:* distribui tráfego com base em pesos (útil para testes A/B).  
  - *Latency-based Routing:* envia usuários para a região com menor latência.  
  - *Failover Routing:* redireciona para recurso de backup em caso de falha.  
  - *Geolocation/Geoproximity Routing:* roteamento baseado na localização do usuário.  
- **Health Checks:** monitora endpoints e redireciona tráfego em caso de falha.  
- **Alta disponibilidade e escalabilidade.**  

### Exemplo Prático
Um site hospedado em **São Paulo** e **Virgínia**:  
- Route 53 pode usar *latency-based routing* para que usuários do Brasil acessem via São Paulo.  
- Caso o servidor de SP caia, *health checks* redirecionam automaticamente o tráfego para Virgínia.  

---

## 5. Amazon CloudFront

### O que faz?
Serviço de **CDN (Content Delivery Network)** que distribui conteúdo através de uma rede global de **edge locations**.  
Quando um usuário acessa o conteúdo, o CloudFront entrega a partir do ponto mais próximo, reduzindo latência e melhorando a experiência.  

### Funcionalidades
- **Distribuição de conteúdo estático e dinâmico** (HTML, CSS, JS, imagens, vídeos, APIs etc.).  
- Integração com **S3, EC2, ELB, Lambda@Edge** e outros serviços AWS.  
- **Segurança:** integração com AWS Shield, AWS WAF, controle de acesso e cache inteligente.  
- **Cache em edge locations:** reduz chamadas ao servidor de origem, economiza recursos e melhora performance.  
- **Lambda@Edge:** permite rodar código (Node.js/Python) próximo ao usuário.  
- **Baixa latência e alta disponibilidade:** ideal para aplicações globais.  

### Exemplo Prático
Site hospedado em bucket S3:  
- Criar distribuição no CloudFront para entregar via edge locations.  
- Configurar HTTPS com domínio próprio.  
- Usar cache para reduzir custos de acesso ao S3.  
- Proteger acesso com WAF e políticas de cache.  

---

## 6. Amazon Elastic Load Balancer (ELB)

Serviço que **distribui automaticamente o tráfego de entrada** entre múltiplas instâncias EC2, containers ou IPs, garantindo **alta disponibilidade, escalabilidade e resiliência**.  

### Tipos de Load Balancer
- **Application Load Balancer (ALB):**  
  - Ideal para aplicações web (HTTP/HTTPS).  
  - Suporta roteamento baseado em conteúdo (path, host, headers).  
  - Integração com ECS e microsserviços.  

- **Network Load Balancer (NLB):**  
  - Alta performance para tráfego TCP/UDP.  
  - Suporta milhões de requisições por segundo.  
  - Ideal para baixa latência, finanças e jogos online.  

- **Gateway Load Balancer (GLB):**  
  - Balanceia tráfego de appliances de rede (firewalls, inspeção de pacotes).  
  - Funciona como gateway transparente.  

- **Classic Load Balancer (CLB):**  
  - Versão mais antiga.  
  - Suporta HTTP/HTTPS e TCP.  
  - Mais indicado para sistemas monolíticos (em desuso gradual).  

### Recursos e Benefícios
- Alta disponibilidade com múltiplas zonas de disponibilidade.  
- Health checks monitorando instâncias.  
- SSL/TLS termination com certificados gerenciados.  
- Escalabilidade automática com Auto Scaling.  
- Segurança integrada com Security Groups e AWS WAF.  

### Exemplo Prático
Aplicação web com várias instâncias EC2:  
- O ELB (ALB) distribui tráfego entre instâncias com base em URLs ou cabeçalhos.  
- Em caso de falha, redireciona automaticamente para instâncias saudáveis.  
- HTTPS pode ser configurado com certificados ACM.  
