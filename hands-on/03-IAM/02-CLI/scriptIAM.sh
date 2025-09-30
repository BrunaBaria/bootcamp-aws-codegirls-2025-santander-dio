#!/bin/bash

ARQUIVO="usuarios.csv"

# Mapeamento de grupos para políticas
declare -A PERMISSOES_GRUPOS
PERMISSOES_GRUPOS["Desenvolvedores"]="arn:aws:iam::aws:policy/ReadOnlyAccess"
PERMISSOES_GRUPOS["Financeiro"]="arn:aws:iam::aws:policy/ReadOnlyAccess"
PERMISSOES_GRUPOS["Marketing"]="arn:aws:iam::aws:policy/ReadOnlyAccess"
PERMISSOES_GRUPOS["RH"]="arn:aws:iam::aws:policy/ReadOnlyAccess"
PERMISSOES_GRUPOS["FinOps"]="arn:aws:iam::aws:policy/ReadOnlyAccess"

while IFS=',' read -r nome grupo senha; do
    echo "Processando usuário: $nome (Grupo: $grupo)..."

    # Criar usuário
    aws iam create-user --user-name "$nome" 2>/dev/null
    echo "Usuário $nome criado."

    # Criar login profile
    aws iam create-login-profile \
        --user-name "$nome" \
        --password "$senha" \
        --password-reset-required \
        2>/dev/null
    echo "Senha definida para $nome."

    # Verificar se grupo existe
    if ! aws iam get-group --group-name "$grupo" 2>/dev/null; then
        echo "Grupo $grupo não existe. Criando..."
        aws iam create-group --group-name "$grupo"
        echo "Grupo $grupo criado."

        # Atribuir política ao grupo
        policy_arn=${PERMISSOES_GRUPOS[$grupo]}
        if [ -n "$policy_arn" ]; then
            aws iam attach-group-policy \
                --group-name "$grupo" \
                --policy-arn "$policy_arn"
            echo "Política $policy_arn atribuída ao grupo $grupo."
        fi
    fi

    # Adicionar usuário ao grupo
    aws iam add-user-to-group \
        --user-name "$nome" \
        --group-name "$grupo"
    echo "Usuário $nome adicionado ao grupo $grupo."

    echo "----------------------------------------"
done < <(tail -n +2 "$ARQUIVO")  # Ignora o cabeçalho do CSV
