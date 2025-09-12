# 1. Entendendo as Instâncias EC2 e a Otimização de Recursos na AWS

- **EC2 (Elastic Compute Cloud)** representa máquinas virtuais na AWS, dentro do modelo **IaaS (Infraestrutura como Serviço)**.  
- As famílias de instância são otimizadas para diferentes finalidades (ex.: computação, memória, armazenamento).  
- Quanto maior a capacidade da instância, maior o custo.  
- A AWS permite **escalabilidade automática (Auto Scaling)** para ajustar recursos conforme a demanda.  

## Elasticidade e Escalabilidade
- **Escalabilidade Vertical**: Aumentar ou reduzir os recursos de uma instância existente (*scale-up / scale-down*).  
- **Escalabilidade Horizontal**: Adicionar ou remover múltiplas instâncias iguais (ideal para picos como Black Friday).  

## Boas Práticas de Otimização
- Sempre remover recursos órfãos ou ociosos para evitar custos desnecessários.  

##  Modelos de Compra de Instâncias
- **On-Demand**: Pagamento sob demanda, ideal para uso flexível e imprevisível.  
- **Reserved Instances (RI)**: Reserva de instâncias por 1 ou 3 anos, com desconto.  
- **Spot Instances**: Instâncias com preço reduzido, porém com risco de interrupção com aviso prévio de 2 minutos.  

---

# 2. Armazenamento na Nuvem com Amazon EBS e S3

## Amazon EBS (Elastic Block Store)
- Funciona como um disco virtual que pode ser anexado (*attach*) ou removido (*detach*) de uma instância EC2.  
- Ideal para armazenamento persistente de dados que precisam ser acessados como em um disco físico.  
- **Snapshot**: uma “fotografia” do estado atual do volume EBS.  
  - Útil para preservar o estado de uma VM antes de atualizações (ex.: aplicação de *patch*).  
- Não deve ser usado como **backup** — é mais voltado para recuperação pontual.  

##  Amazon S3 (Simple Storage Service)
- Armazena objetos (arquivos, imagens, vídeos, etc.), semelhante à **Storage Account no Azure**.  
- Oferece alta durabilidade e disponibilidade, ideal para dados acessados via web ou aplicações.  

## Classes de Armazenamento
- **Standard**: para dados acessados com frequência.  
- **Standard-IA (Infrequent Access)**: para dados acessados com menos frequência.  
- **One Zone-IA**: semelhante ao IA, mas armazenado em uma única zona de disponibilidade.  
- **Glacier**: para arquivamento de longo prazo, com tempo de recuperação em horas.  
- **Glacier Deep Archive**: para dados raramente acessados, com tempo de recuperação em até 12 horas.  

## Lifecycle Management
- Permite automatizar a transição de objetos entre classes de armazenamento com base na frequência de acesso:  
  - Arquivos acessados com frequência (ex.: extrato bancário recente) → **Standard**.  
  - Arquivos antigos (ex.: extrato do ano passado) → **Glacier** ou **Glacier Deep Archive**, dependendo da política da empresa.  

---

## AMI (Amazon Machine Image)
- Imagem pré-configurada de uma máquina virtual (VM), utilizada para iniciar instâncias EC2.  
- Pode ser criada a partir de um snapshot de uma VM existente, esteja ela em execução ou parada.  
- A AMI deve ser compatível com a solução desejada (ex.: se a aplicação for Linux, a AMI precisa ser baseada em Linux).  

## Snapshot de EBS
- Representa uma “fotografia” do estado atual de um volume EBS.  
- Permite a criação de backups com agendamento periódico.  
- Os snapshots são armazenados no **Amazon S3**.  
- O custo varia conforme o tamanho do volume e a região onde está armazenado.  