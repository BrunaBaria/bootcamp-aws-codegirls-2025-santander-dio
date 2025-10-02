# Criação a primeira instância EC2

Um EC2 é uma máquina virtual na AWS. Assim com um computador de mesa, um notebook, essa máquina precisa de alguns recursos atrelados para funcionar, tal qual rede de conexão (VPN), memória, discos, etc.

## Pré-requisitos desta etapa
- Baixe o [MobaXTerm](https://mobaxterm.mobatek.net/download.html)
- Logue com usuário ` administrador`, criado anteriormente
- Certifique-se de que ele possui permissões necessárias para administrar os EC2. ( teste seus conhecimentos!)

## Vamos configurar sua instância?
- Acesse "EC2" -> "Instâncias" -> "Instância de Lançamento"<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/01-ec2.png">
- Escolha um nome para sua primeira instância. Eu escolhi: ` servidor01`;->
- Escolha a imagem que o sistema operacional da sua máquina vai utilizar: ` Amazon Linux` ->
- Na lateral você pode ver o tamanho dela ` t3.micro` e o storage vinculado à ela `1 volume de 8GiB` -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/02-ec2.png"><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/03-ec2.png">
- O tamanho da instância virá pé carregado, não mexeremos nessa parte. Em todo caso, você pode expandir o menu para visualizar os demais tamanhos disponívies. Quanto maior e mais potente a isntância, mais onerosa.<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/04-ec2.png">
- Em "Par de chaves" selecione "Criar par de chaves". É com esse arquivo que você logara na sua instância-> 
- Dê um nome para sua chave e selecione o tipo RSA e formato .pem (SSH) -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/05-ec2.png">
- Ao criar a chave, ela será baixada na sua máquina. Guarde-a bem. 
- Em "Configurações de Rede", ao criar uma EC2, necessáriamente precisa criar uma VPN ou vincular a uma existente. Mantenha as configurações padrões;
- Em "Criar grupo de segurança" é o mesmo caso da rede. Vamos manter o padrão de criar o firewall ->
- Marque "Permitir tráfego SSH"<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/06-ec2.png">
- Não precisa alterar os itens avançados -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/07-ec2.png">
- Criar instância em "Instância de lançamento" -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/08-ec2.png">
- Intância criada -> <img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/05-EC2/img/09-ec2.png">



