CREATE DATABASE SDA_DB; /*criar banco de dados*/
USE SDA_DB;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(22) UNIQUE NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    date_nasc DATE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(30) NOT NULL
);

CREATE TABLE profissional (
    id_profissional INT PRIMARY KEY AUTO_INCREMENT,
    especialidade VARCHAR(75) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(30) NOT NULL,
    cpf VARCHAR(22) UNIQUE NOT NULL,
    status_profissional ENUM('disponivel', 'indisponivel', 'neutro') NOT NULL DEFAULT 'neutro',
    endereco VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email_profissional VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    preco DECIMAL(10 , 2 ) NOT NULL,
    duracao TIME NOT NULL,
    status_servico ENUM('neutro', 'disponivel', 'disponivel') NOT NULL DEFAULT 'neutro'
);

CREATE TABLE agendamento (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_servico INT NOT NULL,
    id_profissional INT NOT NULL,
    data_agendamento DATE NOT NULL,
    hora_agendamento TIME NOT NULL,
    status_agendamento ENUM('pendente', 'confirmado', 'aguarde') NOT NULL DEFAULT 'aguarde',
    obs VARCHAR(100) NULL,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_servico)
        REFERENCES servico (id_servico),
    FOREIGN KEY (id_profissional)
        REFERENCES profissional (id_profissional)
);

CREATE TABLE perfil (
    id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    nome_perfil VARCHAR(100) NOT NULL,
    status_perfil BOOLEAN
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_perfil INT NOT NULL,
    FOREIGN KEY (id_perfil)
        REFERENCES perfil (id_perfil),
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(22) UNIQUE NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dt_admissao DATE NOT NULL,
    Telefone VARCHAR(50) NOT NULL
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_agendamento INT NOT NULL,
    FOREIGN KEY (id_agendamento)
        REFERENCES agendamento (id_agendamento),
    valor DECIMAL(10 , 2 ) NOT NULL,
    forma_pagamento VARCHAR(100) NOT NULL,
    dt_pagamento DATE NOT NULL,
    status_pagamento ENUM('pago', 'em andamento', 'neutro')
);

CREATE TABLE avaliacao (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    nota INT NOT NULL,
    comentario VARCHAR(150),
    data_avaliacao DATE NOT NULL,
    email_avaliacao VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE disponibilidade (
    id_disponibilidade INT PRIMARY KEY AUTO_INCREMENT,
    status_disponibilidade ENUM('disponivel, indisponivel, aguarde') NOT NULL DEFAULT 'aguarde'
);

CREATE TABLE Comprovante (
    id_comprovante INT PRIMARY KEY AUTO_INCREMENT,
    status_comprovante ENUM ('gerado', 'gerando','aguarde') NOT NULL DEFAULT 'aguarde',
    data_comprovante DATE NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf VARCHAR(22) UNIQUE NOT NULL
);