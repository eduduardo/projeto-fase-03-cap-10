
-- Produção total de uma determinada cultura (café) por estado em uma safra específica (exemplo: 2020)
SELECT e.nome_estado, SUM(p.volume_producao) AS total_producao
FROM producao p
JOIN estado e ON p.id_estado = e.id_estado
WHERE p.ano = 2020
GROUP BY e.nome_estado
ORDER BY total_producao DESC;

-- Evolução da produção de uma cultura (café) ao longo dos anos para um estado específico (exemplo: MG)
SELECT p.ano, SUM(p.volume_producao) AS total_producao
FROM producao p
JOIN estado e ON p.id_estado = e.id_estado
WHERE e.nome_estado = 'MG'
GROUP BY p.ano
ORDER BY p.ano;

-- Produção total de uma determinada cultura (café) por região em um ano específico (exemplo: 2020), incluindo sub-regiões
SELECT r.nome_regiao, SUM(p.volume_producao) AS total_producao
FROM producao p
LEFT JOIN estado e ON p.id_estado = e.id_estado
LEFT JOIN subregiao s ON p.id_subregiao = s.id_subregiao
LEFT JOIN regiao r ON e.id_regiao = r.id_regiao OR s.id_regiao = r.id_regiao
WHERE p.ano = 2020
GROUP BY r.nome_regiao
ORDER BY total_producao DESC;