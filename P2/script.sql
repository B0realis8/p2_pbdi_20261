-- 2 Resultado em função da formação dos pais
-- Escreva um stored procedure que exibe o número de alunos aprovados e cujos pais são
-- ambos PhDs.

CREATE OR REPLACE PROCEDURE estudantes_pais()
LANGUAGE plpgsql
AS $$
DECLARE
    n_alunos INT;
BEGIN
    SELECT count(*) FROM estudantes WHERE mother_education = 6 AND father_education = 6 INTO n_alunos;
    RAISE NOTICE 'Número de alunos com pais PHD: %', n_alunos;
END;
$$;

CALL estudantes_pais()


-- 3 Resultado em função dos estudos
-- Escreva um stored procedure que disponibiliza, utilizando um parâmetro em modo OUT, o
-- número de alunos aprovados dentre aqueles que estudam sozinhos.
-- Mensagem de commit: feat(p2): aprovados que estudam sozinhos


CREATE OR REPLACE PROCEDURE estudantes_sozinhos(OUT alunos_aprovados INT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT count(*) FROM estudantes WHERE grade >= 1 AND prep_study = 1 INTO alunos_aprovados;
END;
$$;

DO
$$
DECLARE
    aprovados INT;
BEGIN
    CALL estudantes_sozinhos(aprovados);
    RAISE NOTICE 'Alunos aprovados que estudam sozinhos: %', aprovados;
END;
$$;

