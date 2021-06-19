--Visualizar en el Manual SQL la seccion 11.5 JSON
--Vamos a trabajar con metodos compatibles en Mysql y MariaDB

--Este ejercicio no tendra contexto

DROP DATABASE IF EXISTS SQLTesting;
CREATE DATABASE SQLTesting CHARACTER SET utf8;
USE SQLTesting;

CREATE TABLE DataType(
    id INT AUTO_INCREMENT PRIMARY KEY,
    dec_tempeture DECIMAL(4,2) NOT NULL,
    bit_active BIT NOT NULL,
    big_population BIGINT NOT NULL,
    tin_students TINYINT UNSIGNED NOT NULL,
    tin_volts TINYINT NOT NULL,
    dat_todayDate DATE NOT NULL,
    tim_todayTime TIME NOT NULL,
    tim_todayTimeStamp TIMESTAMP(6) NOT NULL,
    jso_graph JSON NOT NULL,
    dec_salary DECIMAL(8,2) NOt NULL
);

/*
    Enfasis en optimizacion de tipo de datos.
    Comando sensors para obtener datos de los sensores del sistema.
    enfasis en el prefijo.
    Enfasis en diferencia entre float y double.
    Flotante agrega mayor presicion.
*/

CREATE TABLE FireBase(
    id INT AUTO_INCREMENT PRIMARY KEY,
    jso_content JSON NOT NULL
)

INSERT INTO DataType(
    id,
    dec_tempeture,
    bit_active,
    big_population,
    tin_students,
    tin_volts,
    dat_todayDate,
    tim_todayTime,
    tim_todayTimeStamp,
    jso_graph,
    dec_salary
) VALUES (
    181.9, 1, 9800000, 33, -5, NOW(),
    NOW(), NOW(), '{"vertex1":{"w":12.1,"connection":["vertex2"]},"vertex2":{"w": 12}}',
    12000.35, 0.7, 0.7
);

