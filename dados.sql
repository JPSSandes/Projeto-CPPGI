USE CPPGI;

-- =========================
-- TABELAS INDEPENDENTES
-- =========================

INSERT INTO Area (codigo, nome) VALUES
(1, 'Computação'),
(2, 'Engenharia'),
(3, 'Matemática'),
(4, 'Física'),
(5, 'Química'),
(6, 'Biologia'),
(7, 'Administração'),
(8, 'Educação'),
(9, 'Direito'),
(10, 'Economia');

INSERT INTO TipoSecundario (id, tipo_secundario, tipo) VALUES
(1, 'Artigo', 'produção bibliográfica'),
(2, 'Livro', 'produção bibliográfica'),
(3, 'Capítulo', 'produção bibliográfica'),
(4, 'Projeto', 'produção técnica'),
(5, 'Software', 'produção técnica'),
(6, 'Relatório', 'produção técnica'),
(7, 'Orientação IC', 'orientação'),
(8, 'Orientação TCC', 'orientação'),
(9, 'Orientação Mestrado', 'orientação'),
(10, 'Orientação Doutorado', 'orientação');

INSERT INTO Agencia (id, agencia) VALUES
(1, 'CNPq'),
(2, 'CAPES'),
(3, 'FAPESP'),
(4, 'FAPERJ'),
(5, 'FAPEMIG'),
(6, 'FINEP'),
(7, 'BNDES'),
(8, 'UNESCO'),
(9, 'MEC'),
(10, 'União Europeia');

INSERT INTO Curso (codigo, nome, nivel_ensino) VALUES
('CCOMP', 'Ciência da Computação', 'superior'),
('ENGCIV', 'Engenharia Civil', 'superior'),
('ENGELE', 'Engenharia Elétrica', 'superior'),
('MAT', 'Matemática', 'superior'),
('FIS', 'Física', 'superior'),
('QUI', 'Química', 'superior'),
('BIO', 'Biologia', 'superior'),
('ADM', 'Administração', 'superior'),
('DIR', 'Direito', 'superior'),
('PED', 'Pedagogia', 'superior');

INSERT INTO Pesquisador (matricula, nome, tipo, email) VALUES
('P001', 'Ana Silva', 'professor', 'ana@uni.br'),
('P002', 'Bruno Lima', 'professor', 'bruno@uni.br'),
('P003', 'Carlos Souza', 'professor', 'carlos@uni.br'),
('P004', 'Daniela Rocha', 'professor', 'daniela@uni.br'),
('P005', 'Eduardo Alves', 'professor', 'eduardo@uni.br'),
('A001', 'Fernanda Costa', 'aluno', 'fernanda@uni.br'),
('A002', 'Gabriel Pires', 'aluno', 'gabriel@uni.br'),
('A003', 'Helena Martins', 'aluno', 'helena@uni.br'),
('A004', 'Igor Nunes', 'aluno', 'igor@uni.br');

-- =========================
-- TABELAS DEPENDENTES
-- =========================

INSERT INTO Professor (titulo, fk_Pesquisador_matricula) VALUES
('doutor', 'P001'),
('mestre', 'P002'),
('doutor', 'P003'),
('especialista', 'P004'),
('doutor', 'P005');

INSERT INTO Aluno (data_ingresso, data_egresso, fk_Pesquisador_matricula) VALUES
('2020-02-01', NULL, 'A001'),
('2020-02-01', NULL, 'A002'),
('2021-02-01', NULL, 'A003'),
('2021-02-01', NULL, 'A004');

INSERT INTO GrupoPesquisa (id, nome, descricao, link_site, fk_Area_codigo) VALUES
(1, 'IA Aplicada', 'Pesquisa em IA', 'ia.uni.br', 1),
(2, 'Engenharia Estrutural', 'Estruturas', 'estruturas.uni.br', 2),
(3, 'Matemática Pura', 'Teoria', 'mat.uni.br', 3),
(4, 'Física Teórica', 'Partículas', 'fis.uni.br', 4),
(5, 'Química Orgânica', 'Moléculas', 'qui.uni.br', 5),
(6, 'Bioinformática', 'Biologia Computacional', 'bio.uni.br', 6),
(7, 'Gestão', 'Administração', 'adm.uni.br', 7),
(8, 'Educação Digital', 'Ensino', 'edu.uni.br', 8),
(9, 'Direito Público', 'Leis', 'dir.uni.br', 9),
(10, 'Economia Aplicada', 'Mercado', 'eco.uni.br', 10);

INSERT INTO Producao
(id, titulo, descricao, ano_producao, data_inicio, data_termino, fk_Area_codigo, fk_TipoSecundario_id)
VALUES
(1, 'Sistema IA', 'IA aplicada', 2022, '2022-01-01', '2022-12-31', 1, 5),
(2, 'Livro Engenharia', 'Estruturas', 2021, '2021-01-01', '2021-12-31', 2, 2),
(3, 'Artigo Matemática', 'Teoria dos números', 2020, '2020-01-01', '2020-12-31', 3, 1),
(4, 'Projeto Física', 'Partículas', 2023, '2023-01-01', '2023-12-31', 4, 4),
(5, 'Relatório Química', 'Análises', 2022, '2022-01-01', '2022-12-31', 5, 6),
(6, 'Software Bio', 'Bioinfo', 2021, '2021-01-01', '2021-12-31', 6, 5),
(7, 'Projeto Gestão', 'Processos', 2023, '2023-01-01', '2023-12-31', 7, 4),
(8, 'Artigo Educação', 'Ensino digital', 2020, '2020-01-01', '2020-12-31', 8, 1),
(9, 'Livro Direito', 'Constitucional', 2019, '2019-01-01', '2019-12-31', 9, 2),
(10, 'Artigo Economia', 'Mercado', 2021, '2021-01-01', '2021-12-31', 10, 1);

-- =========================
-- TABELAS ASSOCIATIVAS
-- =========================

INSERT INTO Deselvolve (fk_Pesquisador_matricula, fk_Producao_id, fk_Curso_codigo) VALUES
('P001', 1, 'CCOMP'),
('P002', 2, 'ENGCIV'),
('P003', 3, 'MAT'),
('P004', 4, 'FIS'),
('P005', 5, 'QUI'),
('A001', 6, 'BIO'),
('A002', 7, 'ADM'),
('A003', 8, 'PED'),
('A004', 9, 'DIR');

INSERT INTO participa
(fk_Pesquisador_matricula, fk_GrupoPesquisa_id, data_egresso, data_ingresso, tipo) VALUES
('P001', 1, NULL, '2020-01-01', 'lider'),
('P002', 2, NULL, '2020-01-01', 'lider'),
('P003', 3, NULL, '2020-01-01', 'lider'),
('P004', 4, NULL, '2020-01-01', 'lider'),
('P005', 5, NULL, '2020-01-01', 'lider'),
('A001', 6, NULL, '2021-01-01', 'membro'),
('A002', 7, NULL, '2021-01-01', 'membro'),
('A003', 8, NULL, '2021-01-01', 'membro'),
('A004', 9, NULL, '2021-01-01', 'membro');

INSERT INTO Edital
(id, numero, tipo, data_inicio, data_termino,
 fk_Agencia_id, fk_Desenvolve_matricula, fk_Desenvolve_id, fk_Desenvolve_codigo)
VALUES
(1, 'ED-001', 'externo', '2022-01-01', '2022-12-31', 1, 'P001', 1, 'CCOMP'),
(2, 'ED-002', 'interno', '2021-01-01', '2021-12-31', 2, 'P002', 2, 'ENGCIV'),
(3, 'ED-003', 'externo', '2020-01-01', '2020-12-31', 3, 'P003', 3, 'MAT'),
(4, 'ED-004', 'interno', '2023-01-01', '2023-12-31', 4, 'P004', 4, 'FIS');

