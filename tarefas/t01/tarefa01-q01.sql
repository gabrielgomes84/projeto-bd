-- consulta que seleciona os nomes dos funcionários que recebem salários superiores à média salarial do departamento 2 QUESTÃO 1 DA LISTA
SELECT f.nome
FROM funcionario f
WHERE f.salario > (SELECT AVG(f2.salario) 
                    FROM funcionario f2 
                    WHERE f2.cod_depto = 2);
