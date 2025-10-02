##  IAM
O IAM é a parte da AWS que lida com gerenciamento de identidades, de usuários, grupos, políticas,etc.

O ideal é criar grupos de usuários no IAM Ideteinty Center, para deixar o usuário root isolado, inserir os usuários e atribuir políticas e permissões ao grupo. Não faremos isso neste momento pois ao utilizar essa funcionalidade a conta de uso free é suspensa e perderiamos os créditos para testes.

Nesse laboratório vamos trabalhar com usuário root. No mundo real, isole o usuário root por segurança e boas práticas.

### 1) IAM - Criar Usuário e Grupo de Usuários pela Console - sem Identity Center
- Acesse "IAM" -> "Usuário -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/01-user.png">
- "Criar usuário" -> 
- "Nome do usuário" - ` adminstrador ` ->
- marque "Fornecer acesso para os usuários ao Console de Gerenciamento da AWS - opcional"
- marque "Quero criar um usuário do IAM" ->
- Crie um senha personalisada ->
- marque "Os usuários devem criar uma nova senha na próxima sessão (recomendado)." ->
- "Próximo" -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/02-user.png">
- Em "Definir permissões" -> "Criar Grupo" caso você não tenha grupos criados ainda.<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/03-user.png">
- Dê um nome para o grupo e atribua uma política à ele ` AdministratorAccess-Amplify`<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/04-grupos.png">
- "Criar grupo de usuário"<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/05-grupos.png">
- Revisar e criar<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/06-grupos.png">
- Usuário criado com exito!-> <img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/07-grupos.png">
- Adicionar usuário ao grupo -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/10-certifique.png">
- acesse a URL gerada e logue com o usuário criado -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/08-login.png"><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/09-login.png">

obs 1: Caso o usuário esteja sem acessos, certifique-se que o usuário foi realmente atribuido ao grupo com as permissões</br>
obs 2: habilite o MFA para seus usuários cadastrados, por segurança

### 2) IAM - Criar Usuário e Grupo de Usuários pelo CLI
A partir do usuário administrador, vamos criar os demais usuarios, grupos, etc. Logue com usuários "administrador".

Esse usuário precisa de uma política específica para essa adminsitração. Vamos criá-la primeiro:
- Acesse "IAM" -> "Usuário" -> "administrador"<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/11-keysSecret.png">
- "adicionar permissões" ->"criar política em linha"<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/16-criando-politica.png">
- Escreva o .json abaixo, dê o nome da sua política de "AllowUserAndGroupManagement" e criar
```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "AllowUserAndGroupManagement",
			"Effect": "Allow",
			"Action": [
				"iam:CreateUser",
				"iam:DeleteUser",
				"iam:CreateGroup",
				"iam:DeleteGroup",
				"iam:AddUserToGroup",
				"iam:RemoveUserFromGroup",
				"iam:ListUsers",
				"iam:ListGroups",
				"iam:GetUser",
				"iam:GetGroup",
				"iam:AttachGroupPolicy",
				"iam:DetachGroupPolicy",
				"iam:ListAttachedGroupPolicies",
				"iam:PutGroupPolicy",
				"iam:DeleteGroupPolicy",
				"iam:GetGroupPolicy"
			],
			"Resource": "*"
		}
	]
}
```

Agora precisamos criar a chave de acesso desse usuário para utilizar no CLI:
- Acesse novamente "Usuários" -> "administrador"
- "Criar chave de acesso" -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/12-keysSecret.png">
- "CLI" -><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/13-keysSecret.png">
- Criar a chave e SALVAR a chave e a senha, pois não será possivel recuperá-la posteriormente!<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/14-keysSecret.png">

Na sua máquina:
- Prepare seu ambiente instalando o [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) caso ainda não tenha instalado:
    - verifique se está instalado com `aws --version`
    - logue na AWS pelo terminal `aws configure`
    - Insira a Key ID, a Secret key criada, a região ` us-east-2 ` e o formato de saída ` json ` -> <img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/15-cli.png">
- Crie um arquivo .csv com "nome, grupo, senha", chamado [usuario.csv](https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/usuarios.csv)
- rode o script disponível nesse diretório com [./scriptIAM.sh](https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/scriptIAM.sh)
- Na console AWS vai aparecer os grupos e usuários criados<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/18-gruposCriados.png"><img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/03-IAM/img/19-usuariosCriados.png">
