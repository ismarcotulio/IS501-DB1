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