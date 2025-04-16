# Tarefa 01 - Consultas Aninhadas, Visões e CTEs

## Scripts de Criação do Esquema Relacional
- [tarefa01-create.sql](tarefa01-create.sql)

## Scripts de Povoamento
- [tarefa01-inserts.sql](tarefa01-inserts.sql)

## Consultas Resolvidas
- [tarefa01-q01.sql](tarefa01-q01.sql)
- [tarefa01-q03.sql](tarefa01-q03.sql)
- [tarefa01-q06.sql](tarefa01-q06.sql)
- [tarefa01-q14.sql](tarefa01-q14.sql)
- [tarefa01-q17.sql](tarefa01-q17.sql)

## Explicações sobre `NATURAL JOIN`, `CROSS JOIN` e **Windows Functions** no PostgreSQL

**NATURAL JOIN**
O NATURAL JOIN é como se fosse um tipo de junção onde o SQL ele tenta automaticamente combinar as tabelas baseadas nas colunas que possuem o mesmo nome e tipo etc... Ele só realiza a junção apenas nas colunas com o mesmo nome em ambas as tabelas, o que significa que você não precisa especificar a condição de junção, o que pode ser útil para simplificar consultas...

Um exemplo:

SELECT * FROM funcionario NATURAL JOIN departamento;
Aqui o PostgreSQL faz a junção entre as tabelas funcionario e departamento nas colunas com o mesmo nome (por exemplo, cod_depto



**CROSS JOIN**
O CROSS JOIN ele cria um produto cartesiano entre as duas tabelas. ele retorna todas as combinações possíveis entre as linhas das duas tabelas. O número de linhas resultantes é o número de linhas da primeira tabela multiplicado pelo número de linhas da segunda..

Exemplo:

SELECT * FROM funcionario CROSS JOIN departamento;
Se você tiver 5 funcionários e 3 departamentos, o CROSS JOIN vai gerar 15 combinações (5 x 3).



**Windows Functions no PostgreSQL**
Funções de janela são usadas para realizar alguns cálculos sobre um conjunto de linhas relacionadas , mas sem agrupar essas linhas. Ao contrário das funções agregadas como SUM() ou COUNT() as funções de janela retornam um valor para cada linha na janela.

exemplo de função de janela:
SELECT 
    nome,
    salario,
    RANK() OVER (ORDER BY salario DESC) AS ranking
FROM funcionario;

Nesse exemplo acima ai, usamos a função RANK() para classificar os funcionários pelo salário em ordem decrescente. Cada linha da tabela recebe seu "ranking", mas não há agregação das linhas. Isso significa que a consulta vai retornar uma linha para cada funcionário, com seu ranking calculado.
