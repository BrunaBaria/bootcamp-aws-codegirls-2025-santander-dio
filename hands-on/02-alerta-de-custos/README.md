# Criação de Alerta de Custos

## O que foi feito ?

Para a segurança financeira deste laboratório, após criar o MFA, vamos criar uma limite de orçamento, visto que a conta free da AWS tem duração de 6 meses e um budget de 120 dólares.
Vamos fazer este dinheiro render até o fim da prática!

1. **Alerta de Custo**
    - Em "Gerenciamento de fatura e custos" ->
    - "Orçamentos" ->
    - "Criar orçamento" ->
    - "Personalizar" ->    
    - "Orçamento de custos - Recomendado" ->    
<img width="1407" height="1031" alr="1-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/02-alerta-de-custos/img/1-cost-alert.png">
    - "Definir um orçamento" ->
    - Escolha um nome para seu orçamento `aws-practitioner-studies`->
<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/02-alerta-de-custos/img/2-cost-alert.png">
    - Em "Definir valor do orçamento" escolha o período desejado -> 
    - "Diário"
    - Em "Tipo de renovação do orçamento" escolha a recorrência desse orçamento ->
    - "Orçamento recorrente"
    - Em "Data de início" escolha a partir de quando esse orçamento irá vigorar ->
    - "2025/09/26" - essa foi a data de produção deste conteúdo
    - Em "Método de orçamento" escolha como seu orçamento será acompanhado ->
    - "Corrigido"
    - Em "Insira um valor" - esse valor é em dólar ( a AWS não trabalha com conversão de moeda como a Azure, por exemplo) ->
    - "0.01" - vamos escolher o mínimo possivel para ativar o alerta
    - Em "Escopo do orçamento" ->
    - "Todos os serviços da AWS" 
<img width="1407" height="1031" alr="2-cost-alert" src = "https://github.com/BrunaBaria/bootcamp-aws-codegirls-2025-santander-dio/blob/main/hands-on/02-alerta-de-custos/img/3-cost-alert.png">