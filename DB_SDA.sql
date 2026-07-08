CREATE DATABASE DB_SDA;
USE DB_SDA;

CREATE TABLE perfil (
    id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dt_admissao DATE NOT NULL,
    cpf_cnpj VARCHAR(24) NOT NULL UNIQUE,
    dt_nasc DATE NOT NULL
);

CREATE TABLE agendamento (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_profissional INT NOT NULL,
    id_servico INT NOT NULL,
    id_cliente INT NOT NULL,
    id_statusGeral INT NOT NULL
);
  
CREATE TABLE atendente (
    id_atendente INT PRIMARY KEY AUTO_INCREMENT,
    especialidade VARCHAR(100) NOT NULL,
    id_perfil INT NOT NULL,
    id_statusGeral INT NOT NULL
);

CREATE TABLE avaliacao (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    observacao VARCHAR(300) NOT NULL,
    id_cliente INT NOT NULL,
    id_profissional INT NOT NULL,
    nota INT NOT NULL
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    id_perfil INT NOT NULL,
    id_statusGeral INT NOT NULL
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_api_pagamento VARCHAR(100) UNIQUE,
    id_statusGeral INT NOT NULL,
    id_agendamento INT NOT NULL,
    valor DECIMAL(10 , 2 ) NOT NULL,
    data_pagamento DATE NOT NULL,
    forma_pagamento VARCHAR(100) NOT NULL
);
  
CREATE TABLE comprovante (
    id_comprovante INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATETIME NOT NULL,
    id_pagamento INT NOT NULL,
    id_statusGeral INT NOT NULL,
    id_agendamento INT NOT NULL
);
    
CREATE TABLE servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(100) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    duracao TIME NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    id_statusGeral INT NOT NULL,
    categoria VARCHAR(100) NOT NULL
);
     
CREATE TABLE statusGeral (
    id_statusGeral INT PRIMARY KEY,
    desc_status VARCHAR(100) NOT NULL
);
     
CREATE TABLE profissional (
id_profissional INT PRIMARY KEY AUTO_INCREMENT,
id_perfil INT NOT NULL,
id_statusGeral INT NOT NULL
);

ALTER TABLE cliente
ADD CONSTRAINT fk_cliente_perfil
FOREIGN KEY (id_perfil)
REFERENCES perfil(id_perfil);

ALTER TABLE cliente
ADD CONSTRAINT fk_cliente_status
FOREIGN KEY (id_statusGeral)
REFERENCES statusGeral(id_statusGeral);

ALTER TABLE profissional
ADD CONSTRAINT fk_profissional_perfil
FOREIGN KEY (id_perfil)
REFERENCES perfil(id_perfil);

ALTER TABLE profissional
ADD CONSTRAINT fk_profissional_status
FOREIGN KEY (id_statusGeral)
REFERENCES statusGeral(id_statusGeral);

ALTER TABLE atendente
ADD CONSTRAINT fk_atendente_perfil
FOREIGN KEY (id_perfil)
REFERENCES perfil(id_perfil);

ALTER TABLE atendente
ADD CONSTRAINT fk_atendente_status
FOREIGN KEY (id_statusGeral)
REFERENCES statusGeral(id_statusGeral);

ALTER TABLE servico
ADD CONSTRAINT fk_servico_status
FOREIGN KEY (id_statusGeral)
REFERENCES statusGeral(id_statusGeral);

ALTER TABLE agendamento
ADD CONSTRAINT fk_agendamento_cliente
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);

ALTER TABLE agendamento
ADD CONSTRAINT fk_agendamento_profissional
FOREIGN KEY (id_profissional)
REFERENCES profissional(id_profissional);

ALTER TABLE agendamento
ADD CONSTRAINT fk_agendamento_servico
FOREIGN KEY (id_servico)
REFERENCES servico(id_servico);

ALTER TABLE agendamento
ADD CONSTRAINT fk_agendamento_status
FOREIGN KEY (id_statusGeral)
REFERENCES statusGeral(id_statusGeral);

ALTER TABLE pagamento
ADD CONSTRAINT fk_pagamento_status
FOREIGN KEY (id_statusGeral)
REFERENCES statusGeral(id_statusGeral);

ALTER TABLE pagamento
ADD CONSTRAINT fk_pagamento_agendamento
FOREIGN KEY (id_agendamento)
REFERENCES agendamento(id_agendamento);

ALTER TABLE comprovante
ADD CONSTRAINT fk_comprovante_pagamento
FOREIGN KEY (id_pagamento)
REFERENCES pagamento(id_pagamento);

ALTER TABLE comprovante
ADD CONSTRAINT fk_comprovante_agendamento
FOREIGN KEY (id_agendamento)
REFERENCES agendamento(id_agendamento);

ALTER TABLE comprovante
ADD CONSTRAINT fk_comprovante_status
FOREIGN KEY (id_statusGeral)
REFERENCES statusGeral(id_statusGeral);

ALTER TABLE avaliacao
ADD CONSTRAINT fk_avaliacao_cliente
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);

ALTER TABLE avaliacao
ADD CONSTRAINT fk_avaliacao_profissional
FOREIGN KEY (id_profissional)
REFERENCES profissional(id_profissional);


INSERT INTO statusGeral (id_statusGeral, desc_status)
VALUES
(1, 'Online'),
(2, 'Offline'),
(3, 'Ausente'),
(4, 'Ativo'),
(5, 'Inativo'),
(6, 'Bloqueado'),
(7, 'Pendente'),
(8, 'Confirmado'),
(9, 'Concluído'),
(10, 'Cancelado'),
(11, 'Pago'),
(12, 'Estornado');



 
