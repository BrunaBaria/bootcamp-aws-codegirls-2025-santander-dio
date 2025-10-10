## Criar o primeiro S3
 Um S3 é uo equivalente a uma Storage Account no Azure. É utilizado para armazenar objetos. No S3 você cria "buckets"- "baldes" de armazenamento;

### Pré-requisitos para esta estapa
- nenhum.
 ### Criando seu primeiro Bucket via console
 - Amazon S3 -> Bucket -> Criar bucket
 - Uso geral -> Dê um nome para seu bucket - precisa ser tudo em mínusculo, e devem ser únicos em toda a rede;
 - em "Propriedades do Objeto" -> "ACL desabilitadas"<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/06-S3/img/01-s3.png">
 - em "Configurações de bloqueio de acesso público para este bucket", por default ele vem todo bloqueado, vamos tirar a marcação de default e marcar as duas útlimas;<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/06-S3/img/02-s3.png">
 - Em " Controle de Versão de Bucket" - desabilitar. Neste momento não precisamos do versionamento dos conteúdos do bucket;
 - Em "Tags" - não vamos inserir neste momento, mas é uma prática importante para administração do ambiente;
 - Em "Criptografia padrão" vamos marcar a primeira opção - keys no s3;<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/06-S3/img/03-s3.png">
 - Em "chave do balde" -> "habilitar" -> "criar bucket" -> "bucket criado com sucesso"<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/06-S3/img/04-s3.png">
