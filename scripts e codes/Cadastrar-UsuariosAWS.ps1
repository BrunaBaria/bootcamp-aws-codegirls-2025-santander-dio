# Requer módulo AWS.Tools.IdentityManagement
# Instale caso não tenha:
# Install-Module -Name AWS.Tools.IdentityManagement -Force

# Caminho do arquivo CSV ou Excel
# Estrutura esperada: Nome, Grupo, Senha
# Exemplo CSV:
# Nome,Grupo,Senha
# joao,Developers,Senha@123
# maria,Admins,Senha@123

param(
    [string]$Arquivo = "usuarios.csv"
)

# Função para importar Excel ou CSV
function Importar-Arquivo {
    param([string]$Caminho)

    if ($Caminho.ToLower().EndsWith(".csv")) {
        return Import-Csv -Path $Caminho -Delimiter ","
    }
    elseif ($Caminho.ToLower().EndsWith(".xlsx")) {
        # Requer módulo ImportExcel
        # Install-Module -Name ImportExcel -Force
        return Import-Excel -Path $Caminho
    }
    else {
        throw "Formato de arquivo não suportado. Use CSV ou XLSX."
    }
}

# Importar dados
$usuarios = Importar-Arquivo -Caminho $Arquivo

foreach ($usuario in $usuarios) {
    $nome   = $usuario.Nome
    $grupo  = $usuario.Grupo
    $senha  = $usuario.Senha

    Write-Host "Processando usuário: $nome (Grupo: $grupo)..."

    # Criar usuário
    try {
        New-IAMUser -UserName $nome -Force | Out-Null
        Write-Host "Usuário $nome criado com sucesso."
    }
    catch {
        Write-Host "Usuário $nome já existe ou ocorreu erro: $($_.Exception.Message)"
    }

    # Criar login profile (senha de console)
    try {
        New-IAMLoginProfile -UserName $nome -Password $senha -PasswordResetRequired:$true -Force | Out-Null
        Write-Host "Senha configurada para $nome."
    }
    catch {
        Write-Host "Erro ao definir senha para $nome: $($_.Exception.Message)"
    }

    # Verificar se o grupo existe
    try {
        $grupoExistente = Get-IAMGroup -GroupName $grupo -ErrorAction Stop
    }
    catch {
        Write-Host "Grupo $grupo não existe. Criando..."
        try {
            New-IAMGroup -GroupName $grupo | Out-Null
            Write-Host "Grupo $grupo criado."
        }
        catch {
            Write-Host "Erro ao criar grupo $grupo: $($_.Exception.Message)"
            continue
        }
    }

    # Adicionar usuário ao grupo
    try {
        Add-IAMUserToGroup -UserName $nome -GroupName $grupo -Force | Out-Null
        Write-Host "Usuário $nome adicionado ao grupo $grupo."
    }
    catch {
        Write-Host "Erro ao adicionar $nome ao grupo $grupo: $($_.Exception.Message)"
    }

    Write-Host "----------------------------------------"
}
