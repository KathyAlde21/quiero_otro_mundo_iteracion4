-- Yo quiero otro mundo - Iteracion 4 - Kathy Alderete
USE quiero_otro_mundo_iteracion4;

-- // -- Desarrollo parte 2:
-- // **************************************************************************************
-- Parte 1: Crear entorno de trabajo
-- A) Crear una base de datos //
CREATE DATABASE quiero_otro_mundo_iteracion4;

-- B) Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada. //
-- usuario: otromundo
-- imagen en carpeta


-- // **************************************************************************************
-- Parte 2: Crear dos tablas.
-- C) La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona
	-- horaria (por defecto UTC-3), género y teléfono de contacto).

CREATE TABLE usuarios_aplicacion(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(15) NOT NULL,
    zona_horaria VARCHAR(6) DEFAULT '-03:00',         -- Indica la zona horaria como UTC-3
    genero VARCHAR(25),
    telefono INT NOT NULL,
	UNIQUE(id_usuario)
);
     
-- D) La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la
	-- plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
    
CREATE TABLE horarios_uso_plataforma(
	id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP(),
    fk_id_usuario INT,
    FOREIGN KEY(fk_id_usuario) REFERENCES usuarios_aplicacion(id_usuario),
	UNIQUE(id_ingreso, fk_id_usuario)
);
 
 
-- // **************************************************************************************
-- Parte 3: Modificación de la tabla
-- E) Modifique el UTC por defecto.Desde UTC-3 a UTC-2.

ALTER TABLE usuarios_aplicacion
MODIFY COLUMN zona_horaria VARCHAR(6) DEFAULT '-02:00';


-- // **************************************************************************************
-- Parte 4: Creación de registros. 
-- F) Para cada tabla crea 8 registros.

-- TABLA usuarios_aplicacion
INSERT INTO usuarios_aplicacion (nombre_usuario, apellido_usuario, contrasena, zona_horaria, genero, telefono)
VALUES ('Juan', 'Pérez', 'password123', '-02:00', 'Masculino', 923456789), -- 1
	('María', 'Gómez', 'password456', '-02:00', 'Femenino', 987654321), -- 2
	('Carlos', 'López', 'password789', '-02:00', 'Masculino', 946123789), -- 3
	('Ana', 'Martínez', 'password321', '-02:00', 'Femenino', 932164987), -- 4
	('Luis', 'Rodríguez', 'password654', '-02:00', 'Masculino', 965497321), -- 5
	('Laura', 'Hernández', 'password987', '-02:00', 'Femenino', 789321654), -- 6
	('Pedro', 'García', 'password159', '-02:00', 'Masculino', 959753486), -- 7
	('Sofía', 'Fernández', 'password753', '-02:00', 'Femenino', 975315846); -- 8
SELECT * FROM usuarios_aplicacion;

-- TABLA horarios_uso_plataforma
INSERT INTO horarios_uso_plataforma (fk_id_usuario) -- id y fecha se autocompletan
VALUES  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8);
SELECT * FROM horarios_uso_plataforma;
