# Módulo 8 - Gerenciamento e Governança  

## Tópicos abordados
- AWS CloudWatch  
- AWS CloudTrail  
- AWS CloudFormation  
- AWS Identity and Access Management (IAM)  
- AWS Policies e Roles  
- AWS Well-Architected Framework  
- AWS CAF (Cloud Adoption Framework)  

---

## 1) AWS CloudWatch
- Fornece visibilidade das métricas dos recursos monitorados.  
- Trabalha com eventos autorizados pelos recursos observados.  
- Permite exibição personalizada em dashboards e gráficos.  
- A partir das métricas, é possível criar alertas, notificações e automatizar tomadas de decisão.  
- Ajuda a monitorar a saúde e a integridade operacional dos recursos.  
- Possibilita visualização de Logs dentro do próprio serviço.  

---

## 2) AWS CloudTrail
- Complementa o CloudWatch, com foco em governança.  
- Responsável por auditoria operacional.  
- Registra qual ação foi executada, por qual usuário, função ou serviço (via Console, CLI ou API).  
- Precisa ser habilitado manualmente.  
- Enquanto o CloudWatch gera análises e métricas, o CloudTrail registra trilhas de auditoria com detalhes de alterações, datas e horários (no Azure, equivalentes ao EntraID).  
- Eventos são registrados em JSON.  
- Armazena dados dos últimos 90 dias.  
- Necessário criar uma "trilha" (Trail) para funcionamento.  

---

## 3) AWS CloudFormation (Desafio)
- Muito utilizado na automação de provisionamento de recursos.  
- Suporta linguagens JSON e YAML.  
- Disponibiliza templates prontos, sendo cobrado apenas pelo recurso implementado.  
- Permite versionamento de templates.  
