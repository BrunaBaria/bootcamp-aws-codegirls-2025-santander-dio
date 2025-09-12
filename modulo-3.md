# 1. Criando sua Primeira Instância de EC2

## AWS Organization
- Crie sua estrutura de **grupos**.  
- A separação de grupos é importante para organizar os recursos hierarquicamente na cloud, aplicar políticas e heranças.  
- A inserção de **tags** nos recursos é essencial para agrupamentos de dados e extração de relatórios financeiros.  

## Exemplo de Criação de uma VM EC2
- **Caso de uso**: Hospedagem na web.  
- **Tipo de workload**: Servidor web/aplicações.  
- **Prioridade**: Baixo custo.  
- **Fabricante de CPU**: Sem preferências.  
- **SO**: Linux  
- **Região**: `us-east-1b`  
- **Tamanho**: `t2.nano`  
- **Chaves**: Criar par de chaves SSH RSA `.pem` (acesso via VDI).  
- **Grupo de Segurança**: `default`.  
- **Armazenamento**: 8 GiB gp3.  

**Observações:**  
- VM **encerrada** não gera custos; VM **parada** cobra pelos discos anexados.  
- Na prática, é comum criar redes, espaçamentos e security groups antes de associar as VMs.  

## Acessando via MobaXterm
- Ferramenta de acesso à instância, semelhante a um VDI.  
- Configure em **Edit session → SSH → advanced SSH settings**:  
  - `username`: definido ao criar a VM.  
  - `private key`: arquivo `.pem`.  

## Teste de Conectividade
- Utilize `ping + ip` no terminal de uma VM para outra.  
- Ambas as VMs precisam estar na mesma **VPC**.  
- Máquinas podem estar em regiões diferentes.  

## Comparando EC2 Linux x Windows
- **Security Group (AWS)** = **NSG (Azure)** → onde as regras de acesso são aplicadas (não é firewall).  

| Sistema | Porta Padrão |
|---------|--------------|
| Linux   | SSH 22       |
| Windows | RDP 3389     |

---

# 2. Criando seu Primeiro Bucket na Amazon S3

## Planejamento
- **S3** = Storage Account do Azure.  
- **Amazon S3 bucket** = contêiner de armazenamento.  
- **SQS** = mensageria da AWS.  
- **Lambda** = *Function as a Service (FaaS)*.  
  - No Azure → Azure Functions.  
  - Na GCP → Cloud Functions.  
  - Cobrança pelo **tempo de execução** da função.  

## Criando o Bucket
- Bucket = contêiner para arquivos.  
- **Regras de nome**: letras minúsculas, sem espaços, único no mundo.  
- Possibilidades:  
  - **Versionamento**: sobrescrever arquivos.  
  - **Camadas de acesso**: escolher de acordo com frequência de uso.  
  - **Políticas de retenção/migração**.  
  - **Controle de acesso**: público ou privado.  

### Exercício Prático
- Criar um bucket.  
- Subir arquivos de uma página HTML fornecida pelo instrutor/DIO.  

---

## Git Bash – Comandos Úteis

### Conceitos
- **main** = tronco principal do projeto.  
- **branch** = galhos onde cada pessoa/área pode trabalhar sem afetar a `main`.  
- **merge** = juntar branch ao tronco.  
- **pull** = atualizar repositório local com mudanças do remoto.  

### Comandos Básicos
```bash
git init                         # inicia o repositório local
git clone <url>                  # clona o repositório remoto
git remote add origin <url>      # conecta repositório local a remoto
git branch                       # lista branches locais
git branch <nome>                # cria nova branch
git checkout <nome>              # muda para branch existente
git checkout -b <nome>           # cria e muda para nova branch
git merge <branch>               # mescla outra branch
git status                       # verifica status dos arquivos
pwd                              # mostra diretório atual
ls                               # lista arquivos
ls -a                            # inclui ocultos
git log                          # histórico de commits
git pull origin <branch>         # baixa alterações do remoto
git add <arquivo>                # adiciona arquivo para commit
git add .                        # adiciona todos os arquivos
git commit -m "mensagem"         # registra commit
git push origin <branch>         # envia commits ao remoto
git reset <arquivo>              # remove arquivo do commit local
git rm <arquivo>                 # remove do repo e sistema

```
# Criando um S3 na Prática

### 🔹 Passos para criação
1. Escolha a região: **us-east-1**  
2. **Create Bucket → General purpose → Nome único**  
3. ACLs: **Disabled**  
4. Acessos bloqueados (**desabilitar todas as caixinhas**)  
5. **Desabilitar versionamento**  

### Upload de arquivos
- Escolher classe: **Standard**  

---

## Tornando o Bucket Público

Em **Permissions → Edit policy → Add statement**, adicione a seguinte política:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::SEU_BUCKET/*"
    }
  ]
}

```
## Criar Access Point

1. **Access point → Nome**  
2. **Network origin:** Internet  
3. **Desmarcar** "Block all", manter apenas os dois últimos  
4. Criar ponto de acesso  

### Teste
- Acesse **index.html** → abrir em HTML pelo endereço do bucket  

---

# Criando sua Primeira Função com Amazon Lambda

## O que é Serverless?
Paradigma onde **não é necessário servidor** para gerenciar aplicações.  

### Principais serviços
- DynamoDB (NoSQL)  
- Cognito (autenticação)  
- API Gateway (proteção)  
- S3  
- SNS e SQS (mensageria)  
- Kinesis (logs)  
- Aurora Serverless (DB)  

**Vantagem:** Escalonamento rápido  

---

## EC2 x Lambda

| EC2 | Lambda |
|-----|--------|
| Servidor virtualizado | Sem servidor |
| Limite de RAM/CPU fixo | Até 15 min por execução |
| Pode ficar 24h ligado | Executa sob demanda |
| Escalonamento manual | Escalonamento automatizado |
| Custo contínuo | 1 milhão reqs grátis/mês |

---

## Criando Hello World no Lambda

1. Acesse **Lambda → Create function → Blueprint**  
2. Escolha **hello-world function (Python)**  
3. Crie nova **role** com permissões básicas  
4. Revise o código → **Create function**  

### Testando
- **Create test event** → escolha template hello-world  
- Edite JSON com variáveis  
- **Run test**  

**Monitoramento:** via CloudWatch (logs, chamadas, erros).  

---

## Gatilho com S3

- Configure trigger para eventos de **Create/Delete** no S3  
- Defina sufixo do arquivo (ex.: `.csv`)  
- Ao enviar arquivo ao bucket → Lambda será disparada  

---



