USE InformationTechnologies;

--Limpiar la tabla PCInventory, en ambiente de demostracion
TRUNCATE PCInventory;

INSERT INTO PCInventory(tex_name, sma_ram, sma_ssd) VALUES
    ("Asus P1020",4,32),
    ("Acer P1021",8,32),
    ("HP P1022",16,64),
    ("HP P1023",32,512),
    ("Dell XPS 12",32,512),
    ("Dell XPS 17 1",16,2048),
    ("Dell XPS 17 2",64,2048),
    ("Dell XPS 17 3",16,128),
    ("Dell XPS 17 4",128,256),
    ("Dell XPS 17 5",128,32),
    ("Dell XPS 17 6",128,48),
    ("Dell XPS 17 7",8,64),
    ("Dell XPS 17 8",8,128),
    ("Dell XPS 17 9",8,256)
;