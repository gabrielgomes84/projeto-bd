from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import sessionmaker, declarative_base, relationship

Base = declarative_base()

class Projeto(Base):
    __tablename__ = 'projeto'
    id = Column(Integer, primary_key=True)
    nome = Column(String)
    lider = Column(Integer)
    atividades = relationship("Atividade", back_populates="projeto")

class Atividade(Base):
    __tablename__ = 'atividade'
    id = Column(Integer, primary_key=True)
    nome = Column(String)
    projeto_id = Column(Integer, ForeignKey('projeto.id'))
    projeto = relationship("Projeto", back_populates="atividades")

def main():
    engine = create_engine('postgresql+psycopg2://admin:admin123@localhost:5432/atividadesbd')
    Session = sessionmaker(bind=engine)
    session = Session()

    # Inserir uma atividade
    nova_atividade = Atividade(nome="Nova Atividade ORM", projeto_id=1)
    session.add(nova_atividade)
    session.commit()

    # Atualizar líder do projeto
    projeto = session.query(Projeto).filter_by(id=1).first()
    if projeto:
        projeto.lider = 3
        session.commit()

    # Listar todos os projetos e suas atividades
    projetos = session.query(Projeto).all()
    for p in projetos:
        print(f"Projeto: {p.nome} - Líder: {p.lider}")
        for a in p.atividades:
            print(f"  Atividade: {a.nome}")

    session.close()

if __name__ == "__main__":
    main()
