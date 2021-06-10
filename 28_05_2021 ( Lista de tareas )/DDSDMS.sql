/*
DDS: Data Definition Statement
DDL: Data Definition Language
*/

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
    int_account INT NOT NULL
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

/*
DMS: Data Manipulation Statement
DML: Data Manipulation Language
*/

/*
Para agregar datos a las tablas: INSERT

ejemplos:
INSERT INTO Management( text_name ) VALUES (), (), ();
INSERT INTO Management( text_name ) VALUES();
*/

INSERT INTO Management( text_name ) VALUES
    ("Tecnologia de Informacion"),
    ("Ventas")
;

INSERT INTO Department( id_management, text_name ) VALUES
    (1, "Desarrollo web"),
    (1, "Desarrollo Movil"),
    (2, "Canales Digitales")
;

INSERT INTO Employee( id_department, text_name, int_account ) VALUES
    (1, "Delia", 1001),
    (2, "Fernando", 1002),
    (3, "Jose", 1003)
;

INSERT INTO List( id_employee, text_name ) VALUES
    (1, "Pendiente de Base de datos 1"),
    (3, "Videojuegos"),
    (1, "Pendientes de estudio")
;

INSERT INTO Task( id_list, text_name, text_description ) VALUES
    (1, "Leer el libro principal de la clase", "Refiere al cap 1"),
    (1, "Leer el manual de MYSQL", ""),
    (1, "Buscar el manual de MariaDB", ""),
    (1, "ER", "Revisar el cap que refiere a entidad-relacion"),
    (2, "Metal Gear Solid Collection", ""),
    (1, "Practicar el ejercicio del viernes 28 de mayo", "DMS")
;

--Para eliminar datos de las tablas: DELETE

DELETE FROM Task WHERE id = 3 OR id = 6;

--Para modificar datos en las tablas: UPDATE
UPDATE Employee SET text_name = "Fernando R." WHERE id = 2;

/*
Para listar datos en las tablas: SELECT

ejemplo
SELECT * FROM TABLE;
*/
