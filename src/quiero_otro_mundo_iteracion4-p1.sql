-- Yo quiero otro mundo - Iteracion 4 - Kathy Alderete

-- // -- Recordando conceptos - parte 1:
-- 1) ¿Qué es una transacción en MySql? Definalo y escriba un ejemplo.

-- TRANSACCIONALIDAD : es una secuencia de operaciones que se realiza en una BBDD
					-- se ejecutan como una unidad indivisible, lo que garantiza la consistencia de datos, 
						-- especialmente en operaciones complejas que involucran varias filas o tablas
                    -- en otras palabras, o bien todas las operaciones de la transacción se completan exitosamente
						-- (y se confirman), o ninguna de ellas se aplica (y se revierte).
                    -- es un conjunto de cambios, como crear, modificar o eliminar un campo de una tabla
		-- EJ:
			START TRANSACTION;

			INSERT INTO tabla_algo (nombre, apellido, cargo, sueldo)
			VALUES ('Pedro', 'Perez', 'Contador', 800000),
			('Maria', 'Morales', 'Progranadora', 1200000);

			SELECT * FROM tabla_algo;

			COMMIT;

-- // ----------------------------------------------------------------------------------------------------------

-- 2) Qué beneficios tiene para la consistencia de los datos, ejecutar transacciones. //

    -- Ejecutar transacciones es fundamental para la consistencia de los datos porque asegura que los datos permanezcan
    -- intactos y en un estado válido.
    
    -- Por ejemplo, en la transferencia de fondos entre cuentas:
		-- Sin transacción: Si la primera operación tiene éxito (restar dinero) y la segunda falla (agregar dinero),
						-- el dinero "desaparecería", lo que llevaría a inconsistencias.
		-- Con transacción: Ambas operaciones se ejecutan juntas; si una falla, ambas se revierten, manteniendo
						-- los datos consistentes.

-- // ----------------------------------------------------------------------------------------------------------

-- 3) ¿Qué propiedades tienen las transacciones? Definirlas. //

-- PROPIEDADES ACID: hacen referencia a la manipulacion en la tabla

-- => ATOMICITY : todas las operaciones dentro de una transacción se consideran como una sola unidad, esto garantiza
				-- que despues de la transaccion el trabajo se complete con exito. Si una operación falla, toda la
                -- transacción se revierte
                
-- => COHERENCE : garantiza que despues de la transaccion la BBDD cambia correctamente, la llevan de un estado válido a otro
				-- que está validado, asegurando que las reglas y restricciones de la base de datos se mantengan
                
-- => ISOLATION : el aislamiento permite que cada transacción se ejecute de forma independiente y transparente entre si,
				-- lo que significa que no afecta ni ve los resultados de otras transacciones en curso
                
-- => DURABILITY : asegura que el efecto de una transaccion que ya esta comprometida (COMMIT) va a persistir en caso
				--  de una posterior falla de sistema

-- // ----------------------------------------------------------------------------------------------------------

-- 4) Qué utilidades tienen las sentencias START TRANSACTION, COMMIT y ROLLBACK. //

-- => START TRANSACTION: inicia una nueva transacción que persiste hasta que se ejecute un COMMIT o un ROLLBACK

-- => COMMIT: confirma todos los cambios realizados dentro de la transacción, haciéndolos permanentes

-- => ROLLBACK: se ejecuta de forma automatica si hay una falla en el sistema o BBDD.
			-- Revierte todos los cambios realizados desde el inicio de la transacción que aun no se han cargado a la
            -- BBDD, devolviendola al estado anterior a la transacción, después del ultimo COMMIT

-- // ----------------------------------------------------------------------------------------------------------

-- 5) En términos de sintaxis ¿Cuándo finaliza una transacción? //

	-- finaliza con un COMMIT
