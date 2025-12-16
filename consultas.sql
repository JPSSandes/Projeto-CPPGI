USE CPPGI;

-- CONSULTA 1: Listar todas as produções com sua área e tipo secundário

SELECT 
    p.titulo,
    p.ano_producao,
    a.nome AS area,
    ts.tipo_secundario,
    ts.tipo
FROM Producao p
JOIN Area a ON p.fk_Area_codigo = a.codigo
JOIN TipoSecundario ts ON p.fk_TipoSecundario_id = ts.id;

-- CONSULTA 2: Listar professores e seus títulos

SELECT 
    pe.matricula,
    pe.nome,
    pr.titulo
FROM Professor pr
JOIN Pesquisador pe
    ON pr.fk_Pesquisador_matricula = pe.matricula;

-- CONSULTA 3: Listar pesquisadores e os grupos de pesquisa em que participam

SELECT
    pe.nome AS pesquisador,
    gp.nome AS grupo_pesquisa,
    pa.tipo,
    pa.data_ingresso
FROM participa pa
JOIN Pesquisador pe
    ON pa.fk_Pesquisador_matricula = pe.matricula
JOIN GrupoPesquisa gp
    ON pa.fk_GrupoPesquisa_id = gp.id;

-- CONSULTA 4: Quantidade de produções por área

SELECT
    a.nome AS area,
    COUNT(p.id) AS total_producoes
FROM Area a
LEFT JOIN Producao p
    ON p.fk_Area_codigo = a.codigo
GROUP BY a.nome;

-- CONSULTA 5: Listar editais com agência e produção financiada

SELECT
    e.numero,
    e.tipo,
    ag.agencia,
    p.titulo AS producao,
    pe.nome AS responsavel
FROM Edital e
JOIN Agencia ag
    ON e.fk_Agencia_id = ag.id
JOIN Deselvolve d
    ON e.fk_Desenvolve_matricula = d.fk_Pesquisador_matricula
   AND e.fk_Desenvolve_id = d.fk_Producao_id
   AND e.fk_Desenvolve_codigo = d.fk_Curso_codigo
JOIN Producao p
    ON d.fk_Producao_id = p.id
JOIN Pesquisador pe
    ON d.fk_Pesquisador_matricula = pe.matricula;

