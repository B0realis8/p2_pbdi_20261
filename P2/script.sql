-- 2 Resultado em função da formação dos pais
-- Escreva um stored procedure que exibe o número de alunos aprovados e cujos pais são
-- ambos PhDs.

CREATE OR REPLACE PROCEDURE estudantes_sexo()
LANGUAGE plpgsql
AS $$
DECLARE
    n_alunos INT;
BEGIN
    SELECT count(*) FROM estudantes WHERE mother_education = 6 AND father_education = 6 INTO n_alunos;
    RAISE NOTICE 'Número de alunos com pais PHD: %', n_alunos;
END;
$$;

CALL estudantes_sexo()


