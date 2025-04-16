-- Inserindo dados na tabela departamento
INSERT INTO departamento (codigo, descricao, cod_gerente) VALUES
(1, 'Desenvolvimento', 1),
(2, 'Marketing', 2),
(3, 'RH', 3),
(4, 'Financeiro', 4),
(5, 'Vendas', 5);

-- Inserindo dados na tabela funcionario
INSERT INTO funcionario (codigo, nome, sexo, dt_nasc, salario, cod_depto) VALUES
(1, 'João Silva', 'M', '1985-04-10', 5000, 1),
(2, 'Maria Oliveira', 'F', '1990-08-22', 4500, 2),
(3, 'Carlos Souza', 'M', '1982-11-15', 4000, 3),
(4, 'Ana Costa', 'F', '1988-03-18', 6000, 4),
(5, 'Pedro Almeida', 'M', '1995-01-25', 3500, 5);

-- Inserindo dados na tabela projeto
INSERT INTO projeto (codigo, nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Projeto A', 'Descrição do Projeto A', 1, 1, '2023-01-01', '2023-06-30'),
(2, 'Projeto B', 'Descrição do Projeto B', 2, 2, '2023-02-01', '2023-07-30'),
(3, 'Projeto C', 'Descrição do Projeto C', 3, 3, '2023-03-01', '2023-08-30'),
(4, 'Projeto D', 'Descrição do Projeto D', 4, 4, '2023-04-01', '2023-09-30'),
(5, 'Projeto E', 'Descrição do Projeto E', 5, 5, '2023-05-01', '2023-10-30');

-- Inserindo dados na tabela atividade
INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Atividade A', 'Descrição da Atividade A', 1, '2023-01-01', '2023-01-15'),
(2, 'Atividade B', 'Descrição da Atividade B', 2, '2023-02-01', '2023-02-15'),
(3, 'Atividade C', 'Descrição da Atividade C', 3, '2023-03-01', '2023-03-15'),
(4, 'Atividade D', 'Descrição da Atividade D', 4, '2023-04-01', '2023-04-15'),
(5, 'Atividade E', 'Descrição da Atividade E', 5, '2023-05-01', '2023-05-15');

-- Inserindo dados na tabela atividade_projeto
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
