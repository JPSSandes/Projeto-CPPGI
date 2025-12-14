DROP DATABASE IF EXISTS CPPGI;
CREATE DATABASE CPPGI;
USE CPPGI;

CREATE TABLE TipoSecundario (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo_secundario VARCHAR(128),
    tipo ENUM("orientação", "produção técnica", "podução bibliográfica") NOT NULL
);

CREATE TABLE GrupoPesquisa (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    descricao VARCHAR(512),
    link_site VARCHAR(128) NOT NULL,
    fk_Area_codigo TINYINT UNSIGNED
);

CREATE TABLE Area (
    codigo TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL
);

CREATE TABLE Producao (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR (128) NOT NULL,
    descricao VARCHAR (512),
    ano_producao YEAR NOT NULL,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    fk_Area_codigo TINYINT UNSIGNED,
    fk_TipoSecundario_id TINYINT UNSIGNED
);

CREATE TABLE Agencia (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    agencia VARCHAR (64) NOT NULL
);

CREATE TABLE Pesquisador (
    matricula CHAR(16) PRIMARY KEY,
    nome VARCHAR (64) NOT NULL,
    tipo ENUM("professor", "aluno") NOT NULL,
    email VARCHAR(64)
);

CREATE TABLE Edital (
    numero CHAR(16) NOT NULL,
    tipo ENUM("interno", "externo") NOT NULL,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    id TINYINT UNSIGNED PRIMARY KEY,
    fk_Agencia_id TINYINT UNSIGNED,
    fk_Desenvolve_matricula CHAR(16),
    fk_Desenvolve_id TINYINT UNSIGNED,
    fk_Desenvolve_codigo CHAR(16)
);

CREATE TABLE Curso (
    codigo CHAR(16) PRIMARY KEY,
    nome VARCHAR(64) NOT NULL,
    nivel_ensino ENUM("integrado", "subsequente", "superior") NOT NULL
);

CREATE TABLE Professor (
    titulo ENUM("especialista", "mestre", "doutor") NOT NULL,
    fk_Pesquisador_matricula CHAR(16) PRIMARY KEY
);

CREATE TABLE Aluno (
    data_ingresso DATE,
    data_egresso DATE,
    fk_Pesquisador_matricula CHAR(16),
    PRIMARY KEY (data_ingresso, fk_Pesquisador_matricula)
);

CREATE TABLE Deselvolve (
    fk_Pesquisador_matricula CHAR(16),
    fk_Producao_id TINYINT UNSIGNED,
    fk_Curso_codigo CHAR(16),
    PRIMARY KEY (fk_Pesquisador_matricula, fk_Producao_id, fk_Curso_codigo)
);

CREATE TABLE participa (
    fk_Pesquisador_matricula CHAR(16),
    fk_GrupoPesquisa_id TINYINT UNSIGNED,
    data_egresso DATE,
    data_ingresso DATE,
    tipo VARCHAR(32) NOT NULL,
    PRIMARY KEY (data_ingresso, fk_Pesquisador_matricula, fk_GrupoPesquisa_id)
);
 
ALTER TABLE GrupoPesquisa ADD CONSTRAINT FK_GrupoPesquisa_2
    FOREIGN KEY (fk_Area_codigo)
    REFERENCES Area (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Producao ADD CONSTRAINT FK_Producao_2
    FOREIGN KEY (fk_Area_codigo)
    REFERENCES Area (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Producao ADD CONSTRAINT FK_Producao_3
    FOREIGN KEY (fk_TipoSecundario_id)
    REFERENCES TipoSecundario (id)
    ON DELETE CASCADE;
 
ALTER TABLE Edital ADD CONSTRAINT FK_Edital_2
    FOREIGN KEY (fk_Agencia_id)
    REFERENCES Agencia (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Edital ADD CONSTRAINT FK_Edital_3
    FOREIGN KEY (fk_Desenvolve_matricula, fk_Desenvolve_id, fk_Desenvolve_codigo)
    REFERENCES Deselvolve (fk_Pesquisador_matricula, fk_Producao_id, fk_Curso_codigo);
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Pesquisador_matricula)
    REFERENCES Pesquisador (matricula)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Pesquisador_matricula)
    REFERENCES Pesquisador (matricula)
    ON DELETE CASCADE;
 
ALTER TABLE Deselvolve ADD CONSTRAINT FK_Deselvolve_1
    FOREIGN KEY (fk_Pesquisador_matricula)
    REFERENCES Pesquisador (matricula);
 
ALTER TABLE Deselvolve ADD CONSTRAINT FK_Deselvolve_2
    FOREIGN KEY (fk_Producao_id)
    REFERENCES Producao (id);
 
ALTER TABLE Deselvolve ADD CONSTRAINT FK_Deselvolve_3
    FOREIGN KEY (fk_Curso_codigo)
    REFERENCES Curso (codigo);
 
ALTER TABLE participa ADD CONSTRAINT FK_participa_2
    FOREIGN KEY (fk_Pesquisador_matricula)
    REFERENCES Pesquisador (matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE participa ADD CONSTRAINT FK_participa_3
    FOREIGN KEY (fk_GrupoPesquisa_id)
    REFERENCES GrupoPesquisa (id);
