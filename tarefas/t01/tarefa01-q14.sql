-- Criação da view
CREATE VIEW vw_func_ativ AS
SELECT f.nome, a.codigo AS cod_atividade
FROM funcionario f
JOIN atividade a ON f.codigo = a.cod_responsavel;

-- Consulta usando a view
SELECT nome, COUNT(cod_atividade) AS qtd_atividades
FROM vw_func_ativ
GROUP BY nome;
