import pandas as pd

# Carregar o CSV com dados ajustados
data = pd.read_csv("../assets/dados.csv")

# Dicionário de mapeamento para ID de cada estado/subregião
estados = {
    "RO": 1,
    "AM": 2,
    "PA": 3,
    "BA": 4,
    "MT": 5,
    "GO": 6,
    "MG": 7,
    "ES": 8,
    "RJ": 9,
    "SP": 10,
    "PR": 11,
}
subregioes = {
    "Cerrado": 1,
    "Planalto": 2,
    "Atlântico": 3,
    "Sul e Centro-Oeste": 4,
    "Triângulo, Alto Paranaiba e Noroeste": 5,
    "Zona da Mata, Rio Doce e Central": 6,
    "Norte, Jequitinhonha e Mucuri": 7,
}

# Inserir dados
sql_inserts = []
id_producao = 1  # Inicializa o contador de id_producao
for index, row in data.iterrows():
    for year in range(2001, 2025):
        year_column = str(year)
        if year_column in data.columns:
            value = row[year_column]
            if (
                pd.notna(value)
                and str(value).strip() != "-"
                and str(value).strip() != ""
            ):
                try:
                    value = float(str(value).replace(".", "").replace(",", ".").strip())

                    if row["UNIDADE DA FEDERACAO / REGIAO"] in estados:
                        estado_nome = row["UNIDADE DA FEDERACAO / REGIAO"]
                        sql_inserts.append(
                            f"INSERT INTO producao (id_producao, id_estado, ano, volume_producao) VALUES ({id_producao}, {estados[estado_nome]}, {year}, {value}); -- Estado: {estado_nome}, Ano: {year}, Produção: {value}"
                        )
                        id_producao += 1
                    elif row["UNIDADE DA FEDERACAO / REGIAO"] in subregioes:
                        subregiao_nome = row["UNIDADE DA FEDERACAO / REGIAO"]
                        sql_inserts.append(
                            f"INSERT INTO producao (id_producao, id_subregiao, ano, volume_producao) VALUES ({id_producao}, {subregioes[subregiao_nome]}, {year}, {value}); -- Subregião: {subregiao_nome}, Ano: {year}, Produção: {value}"
                        )
                        id_producao += 1
                except ValueError:
                    print(
                        f"Valor inválido encontrado: {value} na linha {index} e ano {year}"
                    )

# Gravar o SQL gerado em um arquivo .sql
with open("../db/inserts.sql", "w") as file:
    for insert in sql_inserts:
        file.write(insert + "\n")

print("Comandos INSERT gravados em inserts.sql")
