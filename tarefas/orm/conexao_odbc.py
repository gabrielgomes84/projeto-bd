import pyodbc

conn = pyodbc.connect(
    'DRIVER={PostgreSQL Unicode};'
    'SERVER=localhost;'
    'PORT=5433;'
    'DATABASE=AtividadesBD;'
    'UID=atividades_user;'
    'PWD=atividades_senha;'
)
cursor = conn.cursor()

# 1. Inserir uma atividade
cursor.execute("""
    INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim)
    VALUES (100, 'Nova atividade', 'Descrição da nova atividade', 1, CURRENT_DATE, NULL);
""")

# 2. Atualizar líder de projeto
cursor.execute("""
    UPDATE projeto SET cod_responsavel = 2 WHERE codigo = 1;
""")

# 3. Listar projetos e suas atividades
cursor.execute("""
    SELECT p.codigo, p.nome, a.nome AS atividade_nome
    FROM projeto p
    LEFT JOIN atividade_projeto ap ON ap.cod_projeto = p.codigo
    LEFT JOIN atividade a ON a.codigo = ap.cod_atividade;
""")
rows = cursor.fetchall()
for row in rows:
    print(row)

conn.commit()
conn.close()
