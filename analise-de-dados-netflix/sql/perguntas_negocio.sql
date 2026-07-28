-- ==========================================================
-- Projeto: Análise de Dados - Netflix
-- Banco de Dados: PostgreSQL
-- Objetivo: Responder às perguntas de negócio utilizando SQL
-- ==========================================================

------------------------------------------------------------
-- Pergunta 1
-- Quantos títulos existem atualmente?
------------------------------------------------------------

SELECT
    COUNT(*) AS total_titulos
FROM netflix.titles;

------------------------------------------------------------
-- Pergunta 2
-- Quantos são Filmes e quantos são Séries?
------------------------------------------------------------

SELECT
    type AS tipo,
    COUNT(*) AS quantidade
FROM netflix.titles
GROUP BY type
ORDER BY quantidade DESC;

------------------------------------------------------------
-- Pergunta 3
-- Como o catálogo evoluiu ao longo dos anos?
------------------------------------------------------------

SELECT
    EXTRACT(YEAR FROM date_added::DATE) AS ano,
    COUNT(*) AS quantidade
FROM netflix.titles
WHERE date_added IS NOT NULL
GROUP BY EXTRACT(YEAR FROM date_added::DATE)
ORDER BY ano;

------------------------------------------------------------
-- Pergunta 4
-- Quais países possuem mais títulos disponíveis?
------------------------------------------------------------

SELECT
    country AS pais,
    COUNT(*) AS quantidade
FROM (
    SELECT
        UNNEST(STRING_TO_ARRAY(country, ', ')) AS country
    FROM netflix.titles
    WHERE country IS NOT NULL
)
GROUP BY country
ORDER BY quantidade DESC;

------------------------------------------------------------
-- Pergunta 5
-- Quais gêneros são mais frequentes?
------------------------------------------------------------

SELECT
    genre AS genero,
    COUNT(*) AS quantidade
FROM (
    SELECT
        UNNEST(STRING_TO_ARRAY(listed_in, ', ')) AS genre
    FROM netflix.titles
)
GROUP BY genre
ORDER BY quantidade DESC;

------------------------------------------------------------
-- Pergunta 6
-- Quais classificações indicativas aparecem com maior frequência?
------------------------------------------------------------

SELECT
    rating AS classificacao,
    COUNT(*) AS quantidade
FROM netflix.titles
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY quantidade DESC;

------------------------------------------------------------
-- Pergunta 7
-- Quais diretores possuem mais títulos cadastrados?
------------------------------------------------------------

SELECT
    director AS diretor,
    COUNT(*) AS quantidade
FROM (
    SELECT
        UNNEST(STRING_TO_ARRAY(director, ', ')) AS director
    FROM netflix.titles
    WHERE director IS NOT NULL
)
GROUP BY director
ORDER BY quantidade DESC;

------------------------------------------------------------
-- Pergunta 8
-- Em quais meses a Netflix adicionou mais conteúdos?
------------------------------------------------------------

SELECT
    EXTRACT(MONTH FROM date_added::DATE) AS mes,
    COUNT(*) AS quantidade
FROM netflix.titles
WHERE date_added IS NOT NULL
GROUP BY EXTRACT(MONTH FROM date_added::DATE)
ORDER BY quantidade DESC;