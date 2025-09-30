# Trabalhando com a AWS
----
Nesta coleção de pastas, vou disponibilizar etapas de hands-on concluídas na console da AWS, bem como imagens que comprovam as práticas.
Abaixo segue a lista das atividades realizadas e praticadas nos laboratórios
--- 
## Preparando o ambiente
0) Criar a Conta na AWS
1) Cadastrar o MFA
2) Cadastrar limite de custos no 'Billing and Cost Management' 
3) IAM - cadastro de usuários, grupos de usuários e politicas

##  IAM
O ideal é criar grupos de usuários No IAM Ideteinty Center, para deixar o usuário root isolado, inserir os usuários e atribuir politicas e permissões ao grupo. Não faremos isso nesse momento pois ao utilizar essa funcionalidade a conta de uso free é suspensa e perderiamos os créditos para testes.
 Nesse laboratório vamos trabalhar com usuário root. No mundo real, isole o usuário root por segurança e boas práticas.


### IAM - Criar Usuário e Grupo de Usuários pela Console
- Criar usuário
- nome do usuário
- marque "Fornecer acesso para os usuários ao Console de Gerenciamento da AWS - opcional"
- marque "Quero criar um usuário do IAM"
- Crie um senha personalisada
- marque "Os usuários devem criar uma nova senha na próxima sessão (recomendado)."
- Próximo
- "criar grupo"
- Dê um nome para o grupo e atribua uma política à ele (AdministratorAccess-Amplify)
- "Criar grupo de usuário"
- Adicionar usuário ao grupo
- Revisar e criar
- acesse a URL gerada e logue com o usuário criado

obs 1: Caso o usuário esteja sem acessos, certifique-se que o usuário foi realmente atribuido ao grupo com as permissões
obs 2: habilite o MFA para seus usuários cadastrados, por segurança

### IAM - Criar Usuário e Grupo de Usuários pela Console
A partir do usuário administrador, vamos criar os demais usuarios, grupos, etc. 
Esse usuário precisa de uma política específica para essa adminsitração. Vamos criá-la primeiro:
- Acesse "IAM", "Usuário", "administrador"
- "adicionar permissões", "criar política em linha"
- Escreva o .json abaixo, dê o nome da sua política de "AllowUserAndGroupManagement" e criar
`{
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
}`


Agora precisamos criar a chave de acesso desse usuário para utilizar no CLI:
- Acesse "Usuários" 
- "administrado"
- "Criar chave de acesso"
- "CLI"
- Criar a chave e SALVAR a chave e a senha, pois não será possivel recuperá-la posteriormente!

Na sua máquina:
- Prepare seu ambiente instalando o SDk da AWS com:
    - verifique se está isntalado com `aws --version`
    - ou instale aws config
    - logue na AWS pelo terminal `aws configure`
    - Insira o ID, a Acess Key criada, a regiao e o formato de saída json
- Crie um arquivo .csv com "nome, grupo, senha", chamado "usuario.csv"
- rode o script disponível nesse diretório com `./scriptIAM.sh`

