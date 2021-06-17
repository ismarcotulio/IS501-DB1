DROP DATABASE IF EXISTS ConceptsAndSamples;

CREATE DATABASE ConceptsAndSamples CHARACTER SET utf8;

USE ConceptsAndSamples;

/*
Nomenclatura: Ahora todo los tipos de datos numericos tendra como 
prefijo "num_"
*/

--Evitar campos en nulo

CREATE TABLE DataTableSectionA(
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_tiny TYNYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT "
    valor de 0 a 255",
    num_int INT NOT NULL DEFAULT 0 COMMENT "
    Corresponde con un valor de entero cualquiera",
    num_float FLOAT NOT NULL DEFAULT 0 COMMENT "
    Corresponde con un valor flotante cualquiera",
    num_double DOUBLE NOT NULL DEFAULT 0 COMMENT "
    Corresponde con unvalor flotante doble cualquiera",
    tex_name TEXT NOT NULL DEFAULT "" COMMENT "
    Corresponde con un texto cualquiera para demostraciones LIKE"
    
)COMMENT "Tabla de datos de demostracion de una seccion A";

/*
NOTA: MANUAL SQL 13.1.18.4 -> observacion, conversiones de tipos de datos.
*/

/*
--Creando tabla que replica todos los datos de otra 

CREATE TABLE DataTableSectionB SELECT * FROM DataTableSectionA;
*/

--Creando tabla que replica la estructura de otra

CREATE TABLE DataTableSectionB LIKE DataTableSectionA;