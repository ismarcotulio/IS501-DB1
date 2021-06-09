@author jose.inestroza@unah.edu.hn
@version 0.1.0
@date 2021/05/20

Funcionalidades generales usando SQL
----
----

Generacion de flotantes aleatorios

    SELECT 
        RAND()
    ;

Generacion de enteros aleatiorios ( usando aliasing )

    SELECT 
        CAST( RAND()*(100-0)+0 AS INT) AS "Numero"
    ;

Extraccion de datos de fechas

    SELECT 
        YEAR( NOW() ) AS "Anio",
        MONTH( NOW() ) AS "mes",
        DAY( NOW() ) AS "Dia"
    ;

Generacion de fechas

    SELECT NOW();

Concatenar

    SELECT
        CONCAT( "Hola", " ", "Mundo" ) AS "Cadena de ejemplo"
    ;

Generar una sentencia de SQL, usando SQL

    SELECT
        CONCAT( "SELECT", " ", "RAND()", ";" ) AS "Instruccion"
    ;
