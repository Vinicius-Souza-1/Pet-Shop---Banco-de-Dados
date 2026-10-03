# Dicionário de dados

Exportado do modelo lógico mais recente selecionado para o portfólio.


## PESSOA

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_pessoa | INT | Sim |
| cpf | VARCHAR(11) | Sim |
| nome | VARCHAR(100) | Sim |
| email | VARCHAR(100) | Sim |
| data_nascimento | DATE | Não |
| telefone | VARCHAR(20) | Sim |

## CLIENTE

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_pessoa | INT | Sim |

## FUNCIONARIO

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_pessoa | INT | Sim |
| salario | DECIMAL(10,2) | Sim |
| data_admissao | DATE | Sim |

## ESPECIE

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_especie | INT | Sim |
| nome | VARCHAR(50) | Sim |

## RACA

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_raca | INT | Sim |
| nome | VARCHAR(100) | Sim |
| id_especie | INT | Sim |

## ANIMAL

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_animal | INT | Sim |
| nome | VARCHAR(100) | Sim |
| data_nascimento | DATE | Não |
| id_cliente | INT | Sim |
| id_raca | INT | Sim |

## AGENDAMENTO

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_agendamento | INT | Sim |
| data_agendamento | DATE | Sim |
| horario_agendamento | TIME | Sim |
| status | VARCHAR(30) | Sim |
| id_animal | INT | Sim |

## TIPO_SERVICO

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_tipo_servico | INT | Sim |
| nome | VARCHAR(100) | Sim |
| descricao | VARCHAR(255) | Não |
| valor_base | DECIMAL(10,2) | Sim |

## SERVICO

| Coluna | Tipo | Obrigatório |
|---|---|---|
| id_servico | INT | Sim |
| data_servico | DATE | Sim |
| horario_servico | TIME | Sim |
| valor_cobrado | DECIMAL(10,2) | Sim |
| id_agendamento | INT | Sim |
| id_funcionario | INT | Sim |
| id_tipo_servico | INT | Sim |