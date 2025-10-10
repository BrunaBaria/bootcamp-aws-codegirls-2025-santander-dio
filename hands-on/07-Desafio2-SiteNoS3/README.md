# Desafio 2 - Carregar um site dentro de um S3

Nesta etapa do bootcamp, o instrutor disponibilizou um HTML de portifólio para fazer upload no S3. Eu optei por utilizar meu próprio HTML.

## Subindo um site de portifólio no S3

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
<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/07-Desafio2-SiteNoS3/img/05-s3.png">
- Faça o upload de um arquivo de index.html de portifólio.<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/07-Desafio2-SiteNoS3/img/06-s3.png">
- copie a url do index e acesse o site no seu navegador<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/07-Desafio2-SiteNoS3/img/07-s3.png"><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/07-Desafio2-SiteNoS3/img/08-s3.png">

## Finalize

Não esqueça de delatar seu bucket após o laboratório!
- Você precisará deletar todo o conteúdo do bucket e posteriormente deletar o bucket.
   
