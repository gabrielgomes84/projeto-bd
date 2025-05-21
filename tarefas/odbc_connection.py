import pyodbc

# Dados de conexão (ajuste user, password, host, database)
conn_str = (
    "DRIVER={PostgreSQL Unicode};"
    "SERVER=localhost;"
    "PORT=5432;"
    "DATABASE=atividadesbd;"
    "UID=admin;"
    "PWD=admin123;"
)

try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()

    # Inserir uma atividade em algum projeto
    cursor.execute("INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES (10, 'Atividade X', 'Descrição X', 1, '2025-05-20', '2025-06-20')")
    conn.commit()

    # Atualizar o líder de algum projeto
    cursor.execute("UPDATE projeto SET cod_responsavel = 2 WHERE codigo = 1")
    conn.commit()

    # Listar todos os projetos e suas atividades
    cursor.execute("""
        SELECT p.nome AS projeto, a.nome AS atividade 
        FROM projeto p
        JOIN atividade_projeto ap ON p.codigo = ap.cod_projeto
        JOIN atividade a ON a.codigo = ap.cod_atividade
    """)
    rows = cursor.fetchall()
    for row in rows:
        print(f"Projeto: {row.projeto}, Atividade: {row.atividade}")

except Exception as e:
    print("Erro:", e)
finally:
    cursor.close()
    conn.close()
