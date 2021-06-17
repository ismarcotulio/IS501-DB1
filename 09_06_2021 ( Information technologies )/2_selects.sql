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
