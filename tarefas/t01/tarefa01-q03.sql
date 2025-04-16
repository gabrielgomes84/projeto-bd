SELECT f.nome, f.dt_nasc
FROM funcionario f
JOIN departamento d ON f.cod_depto = d.codigo
WHERE EXTRACT(YEAR FROM AGE(f.dt_nasc)) > 21
  AND f.codigo != d.cod_gerente;
