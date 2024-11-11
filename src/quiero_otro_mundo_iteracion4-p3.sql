-- Yo quiero otro mundo - Iteracion 4 - Kathy Alderete
USE quiero_otro_mundo_iteracion4;

-- // -- Desarrollo parte 3:
-- // **************************************************************************************
-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso? //

-- => Tabla usuarios_aplicacion = para poder contactar nuevamente un usuario se requieren datos mínimos como nombre y
								-- teléfono, además de una contraseña. Por eso los registré con NOT NULL
	-- id_usuario INT AUTO_INCREMENT PRIMARY KEY : con esto determino el dato debe ser un número y autoicrementarse
		-- en cada ingreso
    -- nombre_usuario VARCHAR(50) NOT NULL : la cantidad de caracteres permite que el nombre sea extenso y con
		-- not null obligo a que ingresen un dato
    -- apellido_usuario VARCHAR(50) NOT NULL : la cantidad de caracteres permite que el nombre sea extenso y con
		-- not null obligo a que ingresen un dato
    -- contrasena VARCHAR(15) NOT NULL : permite que el ingreso sea alfanumerico y obligatorio
    -- zona_horaria VARCHAR(6) DEFAULT '-02:00' : valor que quedo igual para todos
    -- genero VARCHAR(25) : las opciones tienen pocos caracteres por lo que con 25 se cubre
    -- telefono INT NOT NULL : obliga a que el telefono sean solo numeros y que sea ingresado
	-- UNIQUE(id_usuario) : es complemento de la primera línea ya que obliga a que el número no se repita

     
-- => Tabla horarios_uso_plataforma = tabla compuesta por llave foranea a tabla usuarios_aplicacion, que es el único
									-- dato que se puede ingresar
	-- id_ingreso INT AUTO_INCREMENT PRIMARY KEY : con esto determino el dato debe ser un número y autoicrementarse
		-- en cada ingreso
    -- fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP() : este valor se autocompleta, permitiendo que el
		-- registro quede grabado con el momento en que se creo
    -- fk_id_usuario INT : defino la llave foranea que voy a llamar como numero, ya que tiene ese valor en su tabla
    -- FOREIGN KEY(fk_id_usuario) REFERENCES usuarios_aplicacion(id_usuario) : con esto indico desde donde viene la llave
	-- UNIQUE(id_ingreso, fk_id_usuario) : es complemento en las llaves ya que obliga a que el número no se repita
 

-- // **************************************************************************************
-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo
	-- electronico).

CREATE TABLE contactos(
	id_contacto INT AUTO_INCREMENT PRIMARY KEY,
	fk_id_usuario INT,
    FOREIGN KEY(fk_id_usuario) REFERENCES usuarios_aplicacion(id_usuario),
    numero_telefono INT NOT NULL,
    email VARCHAR(50) NOT NULL,
	UNIQUE(id_contacto, fk_id_usuario)
);

-- // **************************************************************************************
-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla
	-- Contactos.
SELECT * FROM contactos;
SELECT * FROM usuarios_aplicacion;

ALTER TABLE contactos
RENAME COLUMN numero_telefono TO fk_numero_telefono; -- ok

ALTER TABLE usuarios_aplicacion
ADD CONSTRAINT UNIQUE (telefono); -- ok

ALTER TABLE usuarios_aplicacion
RENAME COLUMN telefono TO id_telefono; -- ok

-- // ---
ALTER TABLE contactos
ADD CONSTRAINT fk_numero_telefono
FOREIGN KEY (fk_numero_telefono) REFERENCES usuarios_aplicacion(id_telefono); -- ok


-- // **************************************************************************************

 -- ***** El ejercicio debe ser subido a github y al Nodo Virtual. ******
-- link GitHub: 
-- https://github.com/KathyAlde21/quiero_otro_mundo_iteracion4
