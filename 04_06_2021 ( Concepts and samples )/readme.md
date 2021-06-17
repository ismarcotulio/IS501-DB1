@author jose.inestroza@unah.edu.hn
@version 0.1.0
@date 2021/06/04

Conceptos a tomar en cuenta
----

- Duplicidad de informacion
- Diagrama ER
- Diagrama de clases UML
- Optimizacion de relaciones
- Normalizacion

----

Los operadores de =, <>, <=, <, >, >=, >>, <<, AND, OR, LIKE
Se pueden usar en expresiones en la lista de columnas de salida
(a la izquierda del FROM) dentro de las instrucciones SELECT. Tambien pueden aplicarse como condicionales dentro del WHERE
por ejemplo:

    SELECT
        col1=1 AND col2=2
    FROM
        MyTable

LIKE
----
El operador LIKE se usa en la clausula WHERE para buscar un patron de texto, especifico sobre un atributo.

Hay 2 comodines (Simbolos especiales o metacaracteres) que se usan comunmente junto con el operador LIKE. Los comodines siguientes pueden variar segun el SGBD.

    - %: El signo de porcentaje representa cero, uno o varios caracteres (.*)
    - _: El signo del guion bajo representa un unico caracter de reemplazo.

A continuacion, se muestran unos ejemplos tradicionales para el uso de LIKE:

    - Buscar cualquier valor que comience con la letra "z" y que tenga al menos 3 caracteres de longitud.
        -nombreAtributo LIKE 'z___%'
    
    - Buscar cualquier valor que tenga la letra "z" en la segunda posicion de la cadena
      - nombreAtributo LIKE '__z%'

    - Buscar cualquier valor de cadena que termine con la letra "z"
      - nombreAtributo LIKE '%z'

    - Buscar cualquier valor que contenga la cadena "HN" en cualquier posicion de un campo de texto especifico.
      - nombreAtributo LIKE '%HN%' OR nombreAtributo LIKE '%hn%'

NOTA:
----
LIKE es un subconjunto de las expresiones regulares (RE)

IN
----
El operador IN es una abreviatura de multiples condiciones OR. El operador IN permite especificar varios valores de una clausula WHERE

    WHERE nombreAtributo IN(value1, value2, value3, ..., valueN);

    WHERE nombreAtributo IN(SELECT STATEMENT);

GROUP BY
----
max, min, avg, sum, count

- La funcion *COUNT()* es la que cuenta la cantidad de registros que coinciden con las condicionales y restricciones de una consulta de select, agrupados por un *GROUP BY*.

- La funcion *MIN()* devuelve el valor mas pequenio de una columna seleccionada.

- La funcion *MAX()* devuelve el valor mas grande de una cadena seleccionada.

- La funcion *AVG()* devuelve el promedio de todos los registros de una columna numerica.

- La funcion *SUM()* devuelve la suma de todos los registros de una columna numerica.

HAVING
----
La clausula *HAVING* de *SQL* se usa para cuando existen condicionales que no pueden aplicarse en el *WHERE*

    GROUP BY atributo HAVING condicionales

ORDER BY
----
----
La palabra clave *ORDER BY* se utiliza para ordenar el conjunto de resultados en orden ascendente o descendente (DESC)

Algebra relacional
----
----
- *JOIN*: Retorna los registros que tienen un match en ambas tablas.
  
- *LEFT JOIN*: Devuelve todos los registros de la tabla izquierda (tabla1) y los registros coincidentes de la tabla derecha (tabla2).El resultado es NULL desde el lado derecho, si no hay coincidencias.
  
- *RIGHT JOIN*: Devuelve todos los registros.






