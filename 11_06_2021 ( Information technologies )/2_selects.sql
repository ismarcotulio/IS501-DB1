USE InformationTechnologies;

--Listar las computadoras que tienen 16 o 32 GB de RAM

SELECT
    tex_name AS "Marca",
    sma_ram AS "RAM",
    sma_ssd AS "SSD"
FROM
    PCInventory
WHERE
    sma_ram IN(16, 32)
;


/*
    Listar los computadores, agrupados por cantidad de RAM, 
    Cuantos computadores hay por cada cantidad de RAM?
*/

SELECT
    sma_ram AS "RAM",
    COUNT(*) AS "Cantidad de computadores"
FROM
    PCInventory
GROUP BY
    sma_ram
;

/*
    Modifique la respuesta anterior para mostrar todas las
    cantidades de RAM, ordenando los resultados de tal forma
    que aparescan de 1era mano, las cantidades de RAM
    con mayor cantidad de computadores.
*/

SELECT
    sma_ram AS "RAM",
    COUNT(*) AS "Cantidad de computadores"
FROM
    PCInventory
GROUP BY
    sma_ram
ORDER BY
    COUNT(*) DESC
;


/*
    Cuales son los grupos que contienen mas de 3 computadores
*/

SELECT
    sma_ram AS "RAM",
    COUNT(*) AS "Cantidad de computadores"
FROM
    PCInventory
GROUP BY
    sma_ram
HAVING
    COUNT(*) > 3
ORDER BY
    COUNT(*) DESC
;


/*
    De la consulta anterior, muestre unicamente los 3 grupos mas grandes
*/

SELECT  
    sma_ram AS "RAM",
    COUNT(*) AS "Cantidad de computadores"
FROM
    PCInventory
GROUP BY
    sma_ram
HAVING
    COUNT(*) >= 3
ORDER BY
    COUNT(*) DESC
LIMIT 3
;

/*
    Cuales son las computadoras que pertenecen a los 3 grupos mas grandes
    de RAM, obtenidas en la consulta anterior? Si una computadora pertenece
    al 4to grupo (o superior), dicho equipo no debe aparecer en los resultados
    siguientes
*/

SELECT
    PCInventory.tex_name AS "Nombre del computador"
FROM
    PCInventory
JOIN
    (
        SELECT
            sma_ram AS "RAM",
            COUNT(*) AS "Cantidad de computadores"
        FROM
            PCInventory
        GROUP BY
            sma_ram
        HAVING
            COUNT(*) >= 3
        ORDER BY
            COUNT(*) DESC
        LIMIT
            3
    ) AS PCRAMGroup ON
        PCInventory.sma_ram + PCRAMGroup.`RAM`
;

/*
    Del resultado anterior, muestre el fabricante (marca) del computador,
    filtrando las marcas sin duplicados.
*/

SELECT
    DISTINCT
        SUBSTRING_INDEX(
            PCInventory.tex_name, " ", 1
        ) AS "Marca"
FROM
    PCInventory
JOIN
    (
        SELECT
            sma_ram
        FROM
            PCInventory
        GROUP BY
            sma_ram
        LIMIT
            3
    ) AS PCRAMGroup ON
        PCInventory.sma_ram = PCRAMGroup.sma_ram
;

--Quemado es un termino que indica un valor no parametrico.



-- Enfasis en el capitulo 12.8 del manual SQL -> String functions and operators

