USE ConceptsAndSamples;

SELECT * FROM DataTableSectionA;
SELECT * FROM DataTableSectionB;

/*
    Cuando esta una relacion entre la tabla derecha e izquierda
    se mostraran todos los datos, de los contrario las inconsistencias
    se imprimiran como NULL
*/

--Right Join

SELECT
    *
FROM
    DataTableSectionA
RIGHT JOIN 
    DataTableSectionB ON DataTableSectionA.num_int = DataTableSectionB.num_int
    --Funciona con datos estructurados y datos relacionados.
;

--Left Join

SELECT
    *
FROM
    DataTableSectionA
LEFT JOIN 
    DataTableSectionB ON DataTableSectionA.num_int = DataTableSectionB.num_int
; 