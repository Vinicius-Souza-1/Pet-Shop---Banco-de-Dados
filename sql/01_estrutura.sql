-- Versao de portfolio derivada do modelo PetShop Corrigido(1).mwb.
-- Executar uma vez em ambiente de estudos. Nao apaga bancos existentes.
CREATE DATABASE portfolio_petshop CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE portfolio_petshop;

CREATE TABLE `PESSOA` (
    `id_pessoa` INT NOT NULL AUTO_INCREMENT,
    `cpf` VARCHAR(11) NOT NULL,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `data_nascimento` DATE NULL,
    `telefone` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id_pessoa`),
    UNIQUE KEY `uq_pessoa_cpf` (`cpf`)
) ENGINE=InnoDB;

CREATE TABLE `CLIENTE` (
    `id_pessoa` INT NOT NULL,
    PRIMARY KEY (`id_pessoa`),
    UNIQUE KEY `fk_cliente_pessoa_idx` (`id_pessoa`),
    CONSTRAINT `fk_cliente_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `PESSOA` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `FUNCIONARIO` (
    `id_pessoa` INT NOT NULL,
    `salario` DECIMAL(10,2) NOT NULL,
    `data_admissao` DATE NOT NULL,
    PRIMARY KEY (`id_pessoa`),
    UNIQUE KEY `fk_funcionario_pessoa_idx` (`id_pessoa`),
    CONSTRAINT `fk_funcionario_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `PESSOA` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `ESPECIE` (
    `id_especie` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id_especie`)
) ENGINE=InnoDB;

CREATE TABLE `RACA` (
    `id_raca` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `id_especie` INT NOT NULL,
    PRIMARY KEY (`id_raca`),
    KEY `fk_raca_especie_idx` (`id_especie`),
    CONSTRAINT `fk_raca_especie` FOREIGN KEY (`id_especie`) REFERENCES `ESPECIE` (`id_especie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `ANIMAL` (
    `id_animal` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `data_nascimento` DATE NULL,
    `id_cliente` INT NOT NULL,
    `id_raca` INT NOT NULL,
    PRIMARY KEY (`id_animal`),
    KEY `fk_animal_cliente_idx` (`id_cliente`),
    KEY `fk_animal_raca_idx` (`id_raca`),
    CONSTRAINT `fk_animal_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_animal_raca` FOREIGN KEY (`id_raca`) REFERENCES `RACA` (`id_raca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `AGENDAMENTO` (
    `id_agendamento` INT NOT NULL AUTO_INCREMENT,
    `data_agendamento` DATE NOT NULL,
    `horario_agendamento` TIME NOT NULL,
    `status` VARCHAR(30) NOT NULL,
    `id_animal` INT NOT NULL,
    PRIMARY KEY (`id_agendamento`),
    KEY `fk_agendamento_animal_idx` (`id_animal`),
    CONSTRAINT `fk_agendamento_animal` FOREIGN KEY (`id_animal`) REFERENCES `ANIMAL` (`id_animal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `TIPO_SERVICO` (
    `id_tipo_servico` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `descricao` VARCHAR(255) NULL,
    `valor_base` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`id_tipo_servico`)
) ENGINE=InnoDB;

CREATE TABLE `SERVICO` (
    `id_servico` INT NOT NULL AUTO_INCREMENT,
    `data_servico` DATE NOT NULL,
    `horario_servico` TIME NOT NULL,
    `valor_cobrado` DECIMAL(10,2) NOT NULL,
    `id_agendamento` INT NOT NULL,
    `id_funcionario` INT NOT NULL,
    `id_tipo_servico` INT NOT NULL,
    PRIMARY KEY (`id_servico`),
    UNIQUE KEY `fk_servico_agendamento_idx` (`id_agendamento`),
    KEY `fk_servico_funcionario_idx` (`id_funcionario`),
    KEY `fk_servico_tipo_servico_idx` (`id_tipo_servico`),
    CONSTRAINT `fk_servico_agendamento` FOREIGN KEY (`id_agendamento`) REFERENCES `AGENDAMENTO` (`id_agendamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_servico_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `FUNCIONARIO` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_servico_tipo_servico` FOREIGN KEY (`id_tipo_servico`) REFERENCES `TIPO_SERVICO` (`id_tipo_servico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
