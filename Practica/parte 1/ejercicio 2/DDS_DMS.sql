DROP DATABASE IF EXISTS CourseEnrollment;

CREATE DATABASE IF NOT EXISTS CourseEnrollment
    CHARACTER SET utf8;

USE CourseEnrollment;

CREATE TABLE IF NOT EXISTS Professor(
    tin_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT
        COMMENT "Identificador del catedratico",
    var_name VARCHAR(50) NOT NULL
        COMMENT "Nombre del catedratico",
    var_code VARCHAR(20) NOT NULL DEFAULT ""
        COMMENT "Corresponde al codigo para identificar a
        un catedratico"  
) COMMENT "Tabla que registra a todos los catedraticos de una academia";

CREATE TABLE IF NOT EXISTS Course(
    int_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
        COMMENT "Identificador de la asignatura",
    var_code VARCHAR(20) NOT NULL DEFAULT ""
        COMMENT "Codigo unico que corresponde a la asignatura",
    tim_entryHour TIME NOT NULL DEFAULT "14:00:00"
        COMMENT "Corresponde a la hora en que comienza la clase",
    dat_startDate DATE NOT NULL 
        COMMENT "Corrresponde a la fecha de inicio de clases",
    enu_period ENUM('1','2','3') NOT NULL DEFAULT '1'
        COMMENT "Corresponde al periodo en que se imparte la clase",
    tin_professor_FK TINYINT UNSIGNED NOT NULL
        COMMENT "Corresponde a la llave principal de la
        tabla de Catedraticos",
    CONSTRAINT tin_professor_FK1 FOREIGN KEY (tin_professor_FK)
        REFERENCES Professor(tin_id)     
) COMMENT "Tabla que registra a todas las asignaturas que se imparten durante toda la
    exitencia de la academia";

CREATE TABLE IF NOT EXISTS Student(
    int_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
        COMMENT "Identificador de cada estudiante",
    var_name VARCHAR(30) NOT NULL 
        COMMENT "Corresponde al nombre completo del estudiante",
    var_account VARCHAR(16) NOT NULL
        COMMENT "Corresponde al numero de cuenta del estudiante en donde
        el formato es: anio de matricula, anio de nacimiento y numero de
        estudiante con una capacidad maxima de 10,000,000 de estudiantes
        EJ: 2020199610000000",
    dat_birth DATE NOT NULL
        COMMENT "Corresponde a la fecha de nacimiento del estudiante"
) COMMENT "Tabla que registra a cada estudiante que desea matricular clases en la academia";

CREATE TABLE IF NOT EXISTS Enrollment(
    int_course_FK INT UNSIGNED NOT NULL
        COMMENT "Corresponde a la llave primaria de un curso a matricular",
    int_student_FK INT UNSIGNED NOT NULL
        COMMENT "Corresponde a la llave principal de un estudiante que desea matricular un curso",
    CONSTRAINT int_course_FK1 FOREIGN KEY (int_course_FK) REFERENCES Course(int_id),
    CONSTRAINT int_student_FK1 FOREIGN KEY (int_student_FK) REFERENCES Student(int_id)
) COMMENT "Tabla que registra cada vez que un estudiante matricula una asignatura";

INSERT INTO Professor( var_name, var_code ) VALUEs
    ('Leaonard','Leo99Iz4'),
    ('Javi', 'Jav88Iz5')
;

INSERT INTO Course( var_code, tim_entryHour, dat_startDate, enu_period, tin_professor_FK ) VALUES 
    ('Mathmm200', '02:00:00', '2021-03-04', '2', 1),
    ('MM200', '03:00:00', '2021-03-04', '2', 1),
    ('IS410', '08:00:00', '2021-01-04', '1', 2)
;

INSERT INTO Student( var_name, var_account, dat_birth ) VALUES
    ('Juan', '202019961', '1996-06-14'),
    ('Pedro', '201719942', '1994-04-04'),
    ('Luis', '201819953', '1995-07-30')
;

INSERT INTO Enrollment( int_course_FK, int_student_FK) VALUES
    (1,1),(1,2),(1,3),(2,1),(2,3),(3,3)
;





SELECT
    CAST(
        SUM(SampleCourse.totalCourse)/COUNT(SampleCourse.totalCourse) AS DECIMAL(8,2)
    ) AS "Promedio de asignaturas que matricula un estudiante"
FROM
    (
        SELECT
            COUNT(int_course_FK) AS totalCourse
        FROM
            Enrollment
        GROUP BY
            Enrollment.int_student_FK
    ) AS SampleCourse

;



SELECT
    CAST(
        SUM(SampleCourse.totalCourse)/COUNT(SampleCourse.totalCourse) AS DECIMAL(8,2)       
    ) AS "Promedio de asignaturas asignadas a un catedratico"
FROM
    (
        SELECT
            COUNT(int_id) AS totalCourse
        FROM
            Course
        GROUP BY
            tin_professor_FK
    ) AS SampleCourse
;