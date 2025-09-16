# Requer módulo AWS.Tools.IdentityManagement
# Instale caso não tenha:
# Install-Module -Name AWS.Tools.IdentityManagement -Force

param(
    [string]$Arquivo = "usuarios.csv"
)

# Mapeamento Grupo -> Política(s) a serem atribuídas
# Use o ARN da política
# https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html
$PermissoesGrupos = @{
    "Admins"      = @("arn:aws:iam::aws:policy/AdministratorAccess")
    "Developers"  = @("arn:aws:iam::aws:policy/PowerUserAccess")
    "ReadOnly"    = @("arn:aws:iam::aws:policy/ReadOnlyAccess")
}

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

$usuarios = Importar-Arquivo -Caminho $Arquivo

foreach ($usuario in $usuarios) {
    $nome   = $usuario.Nome
    $grupo  = $usuario.Grupo
    $senha  = $usuario.Senha

    Write-Host "Processando usuário: $nome (Grupo: $grupo)..."

    # Criar usuário
    try {
        New-IAMUser -UserName $nome -Force | Out-Null
        Write-Host "Usuário $nome criado."
    }
    catch {
        Write-Host "Usuário $nome já existe ou erro: $($_.Exception.Message)"
    }

    # Criar login profile (senha console)
    try {
        New-IAMLoginProfile -UserName $nome -Password $senha -PasswordResetRequired:$true -Force | Out-Null
        Write-Host "Senha definida para $nome."
    }
    catch {
        Write-Host "Erro ao definir senha para $nome: $($_.Exception.Message)"
    }

    # Verificar ou criar grupo
    $novoGrupo = $false
    try {
        $grupoExistente = Get-IAMGroup -GroupName $grupo -ErrorAction Stop
    }
    catch {
        Write-Host "Grupo $grupo não existe. Criando..."
        try {
            New-IAMGroup -GroupName $grupo | Out-Null
            Write-Host "Grupo $grupo criado."
            $novoGrupo = $true
        }
        catch {
            Write-Host "Erro ao criar grupo $grupo: $($_.Exception.Message)"
            continue
        }
    }

    # Se o grupo foi recém-criado, atribuir políticas
    if ($novoGrupo -and $PermissoesGrupos.ContainsKey($grupo)) {
        foreach ($policyArn in $PermissoesGrupos[$grupo]) {
            try {
                Register-IAMGroupPolicy -GroupName $grupo -PolicyArn $policyArn
                Write-Host "Política $policyArn atribuída ao grupo $grupo."
            }
            catch {
                Write-Host "Erro ao atribuir política ao grupo $grupo: $($_.Exception.Message)"
            }
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
