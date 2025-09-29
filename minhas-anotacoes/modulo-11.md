# Módulo 11 - Automações  

## 1) Automatização de Tarefas  

### Ferramentas Nativas AWS
- **AWS CloudFormation**: gerenciamento da infraestrutura como código (IaC), utilizando **JSON** e **YAML**.  
- **AWS Lambda**: execução de funções serverless de até 15 minutos.  
- **AWS CodePipeline**: orquestração de pipelines de **CI/CD**.  
- **AWS Systems Manager**: gerenciamento de servidores, aplicação de patches, execução de automações e manutenção de conformidade.  
- **AWS Step Functions**: criação e orquestração de fluxos de trabalho complexos.  

### Como Automatizar?
- IaC: **CloudFormation, Terraform, Ansible**  
- **Scripts e CLI**  
- **SDKs** para integração com linguagens de programação  

### Benefícios da Automação
- Eficiência  
- Escalabilidade  
- Redução de erros  
- Reprodutibilidade de ambientes  

### Ansible
- Desenvolvido pela **Red Hat**.  
- Utiliza **YAML** (identação obrigatória).  
- Usa **Playbooks** para definir configurações e automações.  
- Mais focado em **configuração** e **gerenciamento pós-criação** (ex.: alterar SO de uma VM já existente, criar usuários, aplicar pacotes).  

### Terraform
- Desenvolvido pela **HashiCorp**.  
- Utiliza a linguagem **HCL (HashiCorp Configuration Language)**.  
- Precisa ser instalado localmente.  
- Permite criar toda a infraestrutura e integrar com Ansible para provisionamento e configuração.  

### PowerShell
- É possível criar **scripts .ps1** para execução e automação de recursos na AWS.  

---

## 2) Desafio - Tarefas Automatizadas com Lambda Functions e S3
- Implementar tarefas automatizadas integrando **S3** e **Lambda**.  
- Usar **AWS LocalStack** para simular serviços AWS localmente e realizar testes sem custos.  

---

## 3) Infraestrutura como Código na AWS com Terraform  

### O que é Terraform?
- Ferramenta de **IaC (Infrastructure as Code)** da HashiCorp.  
- Permite construir e gerenciar infraestrutura de forma **declarativa**.  

### O que posso criar com Terraform?
- VPCs, EC2, S3, Lambda, RDS.  
- Automação de Infraestrutura.  
- Gerenciamento de dependências.  
- Versionamento e reutilização de código.  
- Possibilidade de **rollback** seguro em mudanças.  

### Estrutura do Terraform
- Arquivos de configuração possuem extensão **.tf**.  
- O estado do ambiente é salvo em **.tfstate**.  
- Estrutura baseada em **módulos**:  
  - `main.tf`, `variables.tf`, `outputs.tf`.  
- Principais comandos:  
  - `terraform init` → inicializa ambiente.  
  - `terraform plan` → mostra o que será criado/alterado.  
  - `terraform apply` → aplica as mudanças.  
- É recomendado consultar a documentação oficial para exemplos de módulos.  

---

## 4) Introdução ao DevOps  

- Cultura que integra **Desenvolvimento** e **Operações**.  
- Aproximadamente **50% Automação e 50% Operação**.  

### 5 Princípios do DevOps
1. Colaboração  
2. Automação  
3. Melhoria Contínua  
4. Ação centrada no cliente  
5. Criar soluções com o fim em mente  

### CI/CD
- **CI (Continuous Integration):** desenvolvedores integram código várias vezes ao dia em um repositório, passando por etapas como *plan, code, build e test*.  
- **CD (Continuous Delivery):** após validação no CI, as mudanças são empacotadas e disponibilizadas automaticamente para serem implementadas (test, release, deploy e operate).  

---

## 5) Aplicando o Conceito de DevOps na AWS  

### Serviços AWS para DevOps
- **AWS CodeCommit**: repositório de código (descontinuado).  
- **AWS CodeBuild**: compilação e testes automatizados.  
- **AWS CodeDeploy**: automação de implantação.  
- **AWS CodePipeline**: orquestração de pipelines CI/CD.  
- **AWS CloudFormation**: IaC.  
- **Amazon CloudWatch**: monitoramento de logs e métricas.  
- **AWS IAM**: gestão de permissões e segurança.  

### Exemplo de Workflow GitHub + AWS
1. Criar repositório no **GitHub** com o código.  
2. No **AWS IAM**, criar grupo de devs com permissões (ex.: controle total do S3).  
3. Criar usuário com credenciais e salvar chave de acesso no GitHub em **Secrets and Variables**.  
4. Criar bucket S3 e configurar hospedagem de site estático (`index.html`).  
5. Configurar permissões do bucket para acesso público de leitura.  
6. Adicionar política de **GetObject** (somente leitura).  
7. Usar o **endpoint** do bucket para acessar o site.  
8. Criar workflow GitHub Actions (`.yml`) para automatizar deploy contínuo no S3.  

---

## 6) Explorando Ferramentas da AWS para DevOps  

### Tipos de Nuvem
- **Pública**: serviços disponíveis para qualquer cliente (ex.: AWS, Azure, GCP).  
- **Privada**: nuvem exclusiva para uma organização.  
- **Híbrida**: integração entre nuvem pública e privada.  

### Comparação: Terraform x Ansible x CloudFormation  

#### Terraform
- Cria e gerencia infraestrutura.  
- Baseado em **HCL (JSON compatível)**.  
- Multi-cloud e open source.  

#### Ansible
- Gerencia e automatiza recursos na nuvem.  
- Usa **Playbooks** escritos em YAML.  
- **Ansible Galaxy**: repositório de módulos e coleções.  
- Focado em **configuração e orquestração**.  

#### CloudFormation
- Exclusivo da AWS.  
- Suporta **YAML** e **JSON**.  
- Mantém a arquitetura dentro do ecossistema AWS.  

---

## Conclusão
- A automação com **IaC** (Terraform, Ansible, CloudFormation) é fundamental para escalar ambientes de forma segura.  
- O **DevOps** promove a integração entre equipes, com foco em colaboração, automação e melhoria contínua.  
- Ferramentas AWS como **CodePipeline, CodeBuild, CodeDeploy** e **CloudWatch** apoiam práticas de **CI/CD**.  
- GitHub + AWS S3 é uma solução prática para **deploy automatizado de sites estáticos**.  
