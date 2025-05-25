-- Passo 1: Criar tabelas sem FKs circulares
CREATE TABLE departamento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100),
    cod_gerente INT
);

CREATE TABLE funcionario (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    sexo CHAR(1),
    dt_nasc DATE,
    salario NUMERIC,
    cod_depto INT
);

CREATE TABLE projeto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    cod_depto INT,
    cod_responsavel INT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo),
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)
);

CREATE TABLE atividade (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    cod_responsavel INT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)
);

CREATE TABLE atividade_projeto (
    cod_projeto INT,
    cod_atividade INT,
    FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo),
    FOREIGN KEY (cod_atividade) REFERENCES atividade(codigo)
);

-- Passo 2: Adicionar FKs que causam ciclo
ALTER TABLE departamento
  ADD CONSTRAINT fk_departamento_gerente FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo);

ALTER TABLE funcionario
  ADD CONSTRAINT fk_funcionario_depto FOREIGN KEY (cod_depto) REFERENCES departamento(codigo);
