DROP DATABASE IF EXISTS InformationTechnologies;
CREATE DATABASE InformationTechnologies;

USE InformationTechnologies;

CREATE TABLE PCInventory(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_name TEXT NOT NULL,
    cod_type ENUM('Laptop', 'Desktop', 'Tablet') NOT NULL 
        DEFAULT 'Laptop',
    sma_ram SMALLINT UNSIGNED NOT NULL DEFAULT 0 
        COMMENT 'RAM',
    sma_ssd SMALLINT UNSIGNED NOT NULL DEFAULT 0
        COMMENT 'SSD' 
) COMMENT "Inventario de computadores" CHARACTER SET utf8; 