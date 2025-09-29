# Módulo 10 - AWS SDKs e AWS CLI  

## AWS SDKs e AWS CLI  
- **SDK**: instalado conforme a linguagem de programação utilizada.  
- Verificação no Git Bash: `npm list -g aws-sdk/types`.  
- Uso no código: instanciar SDK na solução, autenticar no terminal/IDE e executar scripts/automação.  
- **AWS CLI**: acesso via linha de comando (bash).  
  - Listar instâncias EC2:  
    ```bash
    aws ec2 describe-instances --query "Reservation[*].Instances[*].{ID:InstanceId,State:State.Name,Type:InstanceType,Region:Placement.AvailabilityZone}" --output table
    ```
  - Iniciar instância EC2:  
    ```bash
    aws ec2 start-instances --instance-ids <id-da-instancia>
    ```
  - Listar buckets S3:  
    ```bash
    aws s3 ls
    ```
- Necessário instalar o **AWS CLI** separadamente.  
- Comandos úteis:  
  - `aws --version`: verifica instalação.  
  - `aws config`: configurações.  
  - `aws help`: ajuda.  
  - `aws configure`: autenticação.  

---

## AWS CloudFormation  
- Automação de infraestrutura como código.  
- Repositório de **templates** para criar VMs, buckets, bancos de dados etc.  
- Benefícios: ganho de tempo, automação confiável, consistência, padronização, redução de custos, segurança.  
- Suporta **JSON** e **YAML**.  
- Diferença para Terraform:  
  - **CloudFormation**: exclusivo da AWS.  
  - **Terraform**: multi-cloud.  

---

## AWS CodeDeploy  
- Serviço para **implantação automatizada de aplicações**.  
- Facilita instalação de aplicações em ambientes cloud e on-premises.  
- Distribui o código em servidores enquanto a aplicação permanece ativa.  
- Funciona como uma **esteira de automação** para implantações.  
