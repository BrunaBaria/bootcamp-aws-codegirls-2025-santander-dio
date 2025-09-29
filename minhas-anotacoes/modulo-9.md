# Módulo 9 - Segurança   

## Boas Práticas  
- **IaaS**: usuário controla SO, manutenção, segurança, patches, firewall, permissões.  
- **PaaS**: AWS gerencia infra; usuário define acessos, IAM, dados e criptografia (repouso e trânsito).  
- **SaaS**: AWS gerencia tudo; usuário cuida apenas dos acessos.  

## Criptografia  
- **Em repouso**: dados armazenados (S3, DB, disco).  
- **Em trânsito**: dados trafegando na rede.  
- **KMS**: gerenciamento de chaves (equivalente ao Key Vault do Azure).  
- **Secrets Manager**: armazenamento seguro de credenciais/segredos.  
- **CloudHSM**: assinatura digital e mensagens seguras (ex.: PIX).  

## AWS WAF  
- **Firewall**: barreira de proteção.  
- **WAF**: protege sites e apps contra invasões, DDoS, ataques de força bruta e exploração de vulnerabilidades.  
- Permite **regras personalizadas**.  
