## Criar o primeiro S3
 Um S3 é uo equivalente a uma Storage Account no Azure. É utilizado para armazenar objetos. No S3 você cria "buckets"- "baldes" de armazenamento;

### Pré-requisitos para esta estapa
- wip
 ### Criando seu primeiro Bucket via console
 - Amazon S3 -> Bucket -> Criar bucket
 - Uso geral -> Dê um nome para seu bucket - precisa ser tudo em mínusculo, e devem ser únicos em toda a rede;
 - em "Propriedades do Objeto" -> "ACL desabilitadas"
 - em "Configurações de bloqueio de acesso público para este bucket", por default ele vem todo bloqueado, vamos tirar a marcação de default e marcar as duas útlimas;
 - Em " Controle de Versão de Bucket" - desabilitar. Neste momento não precisamos do versionamento dos conteúdos do bucket;
 - Em "Tags" - não vamos inserir neste momento, mas é uma prática importante para administração do ambiente;
 - Em "Criptografia padrão" vamos marcar a primeira opção - keys no s3;
 - Em "chave do balde" -> "habilitar" -> "criar bucket" -> "bucket criado com sucesso"
 - Acesse seu bucket -> "Permissões" e escrever um Json com permissões de Read e Get Object:
   ```
      {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::meubucketdobootcamp/*"
        }
    ]
}
```

- Fazer upload de um arquivo de index.html de portifólio.
- copie a url do index e acesse o site no seu navegador


   
