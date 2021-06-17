/*
    LIKE: retornar todos los registros que la tabla contenga,
    donde existe un espacio en blanco en el campo tex_name
*/

USE ConceptsAndSamples;

SELECT
    id AS "Identificar registro",
    tex_name AS "campo de nombre"
FROM
    DataTableSectionA
WHERE
    tex_name LIKE '% %'
;

/*
    LIKE: retornar todos los registros que la tabla contenga,
    donde no existe un espacio en blanco en el campo tex_name
*/

SELECT
    id AS "Identificador del registro",
    tex_name AS "Campo de nombre"
FROM
    DataTableSectionA
WHERE
    tex_name NOT LIKE '% %'
;

/*
    Listar de la tabla DataTableA, los registros que coincidan
    bajo el campo tex_name, para con la tabla DataTableSectionB
*/

SELECT
    id AS "Identificar del registro",
    tex_name AS "Campo de nombre"
FROM
    DataTableSectionA
WHERE
--tex_name IN ("Hola mundo 1", "Adios Mundo1", "Demostracion")
    tex_name IN (SELECT tex_name FROM DataTableSectionB)
;


/*
    Listar de la tabla DataTableSectionA, los registros que 
    coincidadn bajo el campo de tex_name de la tabla DataTableSectionB,
    cuando en DataTableSectionB este campo contiene registros
    sin espacios en blanco.
*/

SELECT
    DTSA.id AS "Identificar del registro",
    DTSA.tex_name AS "Campo de nombre"
FROM
    ConceptsAndSamples.DataTableSectionA AS DTSA
WHERE
    tex_name IN(
        SELECT
            tex_name
        FROM
            ConceptsAndSamples.DataTableSectionB AS DTSB
        WHERE
            tex_name NOT LIKE '% %'
    )
;

SELECT
    MIN(num_int) AS "Menor valor entero"
FROM
    DataTableSectionA
GROUP BY
    num_int
;


SELECT
    num_int AS "valor entero"
FROM
    DataTableSectionA
GROUP BY
    num_int
;

