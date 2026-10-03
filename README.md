# Pet Shop — modelagem de banco de dados

Projeto acadêmico de Análise e Desenvolvimento de Sistemas organizado para o portfólio de Vinicius Itamar de Souza.

## Objetivo
Organizar o cadastro de pessoas, clientes, funcionários, animais, agendamentos e serviços de banho e tosa.

## Tecnologias e conceitos
MySQL 8.4, MySQL Workbench, SQL, chaves primárias e estrangeiras, especialização de pessoas e cardinalidades.

## Arquivos
- `sql/01_estrutura.sql`: estrutura extraída do modelo lógico selecionado.
- `docs/dicionario.md`: tabelas, colunas e tipos.
- `docs/relacionamentos.md`: explicação das relações.

## Como executar
1. Abra uma conexão de estudos no MySQL Workbench.
2. Abra `sql/01_estrutura.sql` em File > Open SQL Script.
3. Execute o arquivo completo uma única vez. Ele cria o banco `portfolio_petshop`.
4. Atualize Schemas e confira as nove tabelas.
5. Para visualizar o diagrama, utilize Database > Reverse Engineer e selecione esse banco.

O script não apaga bancos. Se o banco já existir, interrompa a execução e use outro ambiente vazio. Não é necessário executar o projeto para ler sua documentação.

## Regras representadas
Cliente e funcionário reutilizam a identificação da pessoa. Um cliente pode possuir vários animais. Cada animal possui raça e cada raça pertence a uma espécie. Um agendamento pode existir antes da realização do serviço. Todo serviço tem um agendamento, um funcionário e um tipo de serviço.

O campo `SERVICO.id_agendamento` é obrigatório e único: cada agendamento pode gerar no máximo um serviço. A estrutura não obriga que um agendamento já tenha serviço.

## Aprendizados e limites
O projeto permite estudar como separar cadastros e relacioná-los sem repetir todos os dados pessoais. Não inclui aplicação, autenticação ou registros de pessoas. Regras como impedir horários conflitantes e valores negativos ainda precisam ser implementadas.

## Origem e validação
Versão de portfólio baseada no arquivo `PetShop Corrigido(1).mwb`. O SQL mais antigo tinha outra estrutura e foi substituído por uma extração do modelo atual. Os arquivos pessoais e os dados internos do Workbench não foram incluídos. A estrutura foi conferida com o modelo; este pacote não foi executado em um servidor MySQL nesta preparação.
