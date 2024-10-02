create database silosignal;

use silosignal;

CREATE TABLE usuario (
    idusuario INT PRIMARY KEY AUTO_INCREMENT,
    fkResponsavel INT,
    fkEmpresa INT, -- precisa colocar a foreign key depois quw a tabela empresa for criada,
    nome VARCHAR(45), -- então terá que colocar em um alter table
    cargo VARCHAR(45),
    whatsapp CHAR(11),
    telComercial CHAR(13),
    email VARCHAR(45),
    CONSTRAINT fk_usuario_responsavel
        FOREIGN KEY (fkResponsavel) REFERENCES usuario(idusuario)
);
