-- ==========================================================
-- Projeto: Análise de Dados - Netflix
-- Banco de Dados: PostgreSQL
-- Objetivo: Criar views auxiliares para modelagem no Power BI
-- ==========================================================

------------------------------------------------------------
-- View de Países
------------------------------------------------------------

CREATE VIEW netflix.vw_countries AS

SELECT
    show_id,
    UNNEST(STRING_TO_ARRAY(country, ', ')) AS country
FROM netflix.titles
WHERE country IS NOT NULL;

------------------------------------------------------------
-- View de Gêneros
------------------------------------------------------------

CREATE VIEW netflix.vw_genres AS

SELECT
    show_id,
    UNNEST(STRING_TO_ARRAY(listed_in, ', ')) AS genre
FROM netflix.titles;

------------------------------------------------------------
-- View de Diretores
------------------------------------------------------------

CREATE VIEW netflix.vw_directors AS

SELECT
    show_id,
    UNNEST(STRING_TO_ARRAY(director, ', ')) AS director
FROM netflix.titles
WHERE director IS NOT NULL;