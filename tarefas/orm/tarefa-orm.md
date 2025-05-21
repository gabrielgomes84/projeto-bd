## ODBC em Python

ODBC é um padrão que faz com que programas em diferentes linguagens acessem bancos de dados de forma independente do SGBD.  
Em Python, podemos utilizar o pacote `pyodbc` para fazer essa conexão via ODBC com o PostgreSQL.  
É necessário configurar o driver ODBC do PostgreSQL e fornecer as credenciais de acesso ao banco no código.

---

## ORM em Python (Django ORM)

ORM (Object-Relational Mapping) é uma técnica que permite manipular dados de um banco relacional como objetos da linguagem de programação.  
No Django, o ORM permite definir modelos (classes) que representam tabelas do banco de dados.  
As operações como inserção, atualização e consulta são feitas por métodos Python, sem escrever SQL diretamente.

Utilizei o **Django ORM**, que já vem integrado ao framework Django e fornece uma abstração de alto nível para lidar com bancos de dados relacionais como PostgreSQL.
