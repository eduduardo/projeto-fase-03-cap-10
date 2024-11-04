-- Criação da tabela regiao
CREATE TABLE regiao (
    id_regiao INT PRIMARY KEY,
    nome_regiao VARCHAR(100) NOT NULL
);

-- Criação da tabela subregiao
CREATE TABLE subregiao (
    id_subregiao INT PRIMARY KEY,
    nome_subregiao VARCHAR(100) NOT NULL,
    id_regiao INT NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES regiao(id_regiao)
);

-- Criação da tabela estado
CREATE TABLE estado (
    id_estado INT PRIMARY KEY,
    nome_estado VARCHAR(100) NOT NULL,
    id_regiao INT NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES regiao(id_regiao)
);

-- Criação da tabela producao
CREATE TABLE producao (
    id_producao INT PRIMARY KEY,
    id_estado INT NULL,
    id_subregiao INT NULL,
    ano INT NOT NULL,
    volume_producao DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
    FOREIGN KEY (id_subregiao) REFERENCES subregiao(id_subregiao)
);

-- Inserindo dados na tabela regiao
INSERT INTO regiao (id_regiao, nome_regiao) VALUES (1, 'NORTE');
INSERT INTO regiao (id_regiao, nome_regiao) VALUES (2, 'NORDESTE');
INSERT INTO regiao (id_regiao, nome_regiao) VALUES (3, 'CENTRO-OESTE');
INSERT INTO regiao (id_regiao, nome_regiao) VALUES (4, 'SUDESTE');
INSERT INTO regiao (id_regiao, nome_regiao) VALUES (5, 'SUL');

-- Inserindo dados na tabela subregiao
INSERT INTO subregiao (id_subregiao, nome_subregiao, id_regiao) VALUES (1, 'Cerrado', 2);
INSERT INTO subregiao (id_subregiao, nome_subregiao, id_regiao) VALUES (2, 'Planalto', 2);
INSERT INTO subregiao (id_subregiao, nome_subregiao, id_regiao) VALUES (3, 'Atlântico', 2);
INSERT INTO subregiao (id_subregiao, nome_subregiao, id_regiao) VALUES (4, 'Sul e Centro-Oeste', 4);
INSERT INTO subregiao (id_subregiao, nome_subregiao, id_regiao) VALUES (5, 'Triângulo, Alto Paranaiba e Noroeste', 4);
INSERT INTO subregiao (id_subregiao, nome_subregiao, id_regiao) VALUES (6, 'Zona da Mata, Rio Doce e Central', 4);
INSERT INTO subregiao (id_subregiao, nome_subregiao, id_regiao) VALUES (7, 'Norte, Jequitinhonha e Mucuri', 4);

-- Inserindo dados na tabela estado
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (1, 'RO', 1);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (2, 'AM', 1);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (3, 'PA', 1);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (4, 'BA', 2);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (5, 'MT', 3);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (6, 'GO', 3);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (7, 'MG', 4); 
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (8, 'ES', 4);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (9, 'RJ', 4);
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (10, 'SP', 4); 
INSERT INTO estado (id_estado, nome_estado, id_regiao) VALUES (11, 'PR', 5);