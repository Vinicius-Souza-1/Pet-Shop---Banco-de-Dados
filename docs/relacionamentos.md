# Relacionamentos

| Origem | Destino | Regra |
|---|---|---|
| PESSOA | CLIENTE / FUNCIONARIO | Subtipos compartilham a chave da pessoa. |
| CLIENTE | ANIMAL | Cada animal tem um cliente; um cliente pode ter vários animais. |
| ESPECIE | RACA | Uma espécie pode ter várias raças. |
| RACA | ANIMAL | Cada animal possui uma raça. |
| ANIMAL | AGENDAMENTO | Um animal pode ter vários agendamentos. |
| AGENDAMENTO | SERVICO | Um agendamento tem zero ou um serviço; todo serviço tem um agendamento. |
| FUNCIONARIO | SERVICO | Um funcionário pode realizar vários serviços. |
| TIPO_SERVICO | SERVICO | Um tipo pode ser utilizado em vários serviços. |

O CPF é uma chave alternativa única de PESSOA. O identificador interno `id_pessoa` é a chave usada nos relacionamentos; não precisa ter o mesmo valor do CPF.
