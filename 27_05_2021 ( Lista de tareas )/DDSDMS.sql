/*
Se eliminara la base de datos en caso de que exista.
( Para entornos de desarrollo )
*/

DROP DATABASE IF EXISTS OfficeToDoList;

/*
Se crea una base de datos 'OfficeToDoList', unicamente cuando
esta no existe
*/

CREATE DATABASE IF NOT EXISTS OfficeToDoList CHARACTER SET utf8;

/*
Se describe mediante una instruccion de SQL, que se hace uso de la
base de datos con el nombre descrito
*/

USE OfficeToDoList;

CREATE TABLE IF NOT EXISTS Management(
    id INT AUTO_INCREMENT PRIMARY KEY,
    text_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Department(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_management INT,
    text_name TEXT NOT NULL COMMENT "Describe el nombre del 
    departamento"
)COMMENT "Registro de los departamentos de la empresa";

CREATE TABLE IF NOT EXISTS Employee(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_department INT NOT NULL COMMENT "Representa el identificador
    primario del registro de la tabla departamento",
    text_name TEXT NOT NULL,
    int_account INT
);

CREATE TABLE List(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_employee INT
    text_name TEXT NOT NULL,
    enum_state ENUM('vigente', 'archivada', 'eliminada') DEFAULT 'vigente'
);

/*
El campo de BIT se puede reemplazar, en ciertos escenarios
especificos por un ENUM("si", "no")
*/

CREATE TABLE Task(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_list INT,
    text_name TEXT NOT NULL,
    text_description TEXT,
    bit_state BIT,
    tim_dueDate TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);


