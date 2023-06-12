-- Creación de procedimientos almacenados
DROP PROCEDURE IF EXISTS sp_gruposest;
DROP PROCEDURE IF EXISTS sp_gruposprof;
DROP PROCEDURE IF EXISTS sp_infoest;
DROP PROCEDURE IF EXISTS sp_evalnum;
DROP PROCEDURE IF EXISTS sp_evalabi;
DROP PROCEDURE IF EXISTS sp_calinumerica;
DROP PROCEDURE IF EXISTS sp_caliabierta;
DROP PROCEDURE IF EXISTS sp_promtotaleval;
DROP PROCEDURE IF EXISTS sp_diagnum;
DROP PROCEDURE IF EXISTS sp_obtenerprof;
DROP PROCEDURE IF EXISTS sp_aggpregunta;
DROP PROCEDURE IF EXISTS sp_modpregunta;
DROP PROCEDURE IF EXISTS sp_delpregunta;

-- Obtener la lista de grupos en los que está inscrito un estudiante.
DELIMITER $$
CREATE PROCEDURE sp_gruposest (usuario VARCHAR(45))
	BEGIN
		DECLARE idest INT;
        SELECT est_ID INTO idest FROM estudiante JOIN persona ON est_ID=per_ID
        WHERE per_Usuario=usuario;
		SELECT gru_codigo,asi_Nombre,asi_creditos,per_Nombres,per_Apellidos
        FROM grupo_estudiante NATURAL JOIN grupo NATURAL JOIN asignatura JOIN persona ON pro_ID=per_ID
		WHERE est_ID=idest;
    END $$
    
-- Obtener la lista de grupos en los que dicta un profesor.
CREATE PROCEDURE sp_gruposprof (usuario VARCHAR(45))
	BEGIN
		DECLARE idprof INT;
        SELECT pro_ID INTO idprof FROM profesor JOIN persona ON pro_ID=per_ID
        WHERE per_Usuario=usuario;
        
		SELECT gru_Codigo, asi_Nombre
        FROM grupo NATURAL JOIN asignatura
		WHERE pro_ID=idprof;
    END $$

-- Obtener la información personal de un estudiante (nombre, apellidos, etc.).

CREATE PROCEDURE sp_infoest (username VARCHAR(45))
	BEGIN
		SELECT per_Nombres, per_Apellidos, est_PAPA, est_PAPPI, est_PA, est_Grado, car_Nombre, fac_Nombre, sed_Nombre
		FROM persona JOIN estudiante NATURAL JOIN carrera NATURAL JOIN facultad NATURAL JOIN sede ON per_ID=est_ID WHERE per_Usuario=username
		AND per_Rol='Estudiante';
    END $$

-- Registrar la evaluación numérica de un estudiante en un grupo específico.

CREATE PROCEDURE sp_evalnum (numpre INT, usuario VARCHAR(45), codgru INT, eval INT)
	BEGIN
		DECLARE idest INT;
        SELECT est_ID INTO idest FROM estudiante JOIN persona ON est_ID=per_ID
        WHERE per_Usuario=usuario;
        
		INSERT INTO evaluacion_numerica(pre_Numero, est_ID, gru_Codigo, eva_Calificacion)
        VALUES(numpre, idest, codgru, eval);
        
        UPDATE estudiante
        SET est_Evaluacion = 1
        WHERE est_ID = idest;
        
    END $$

-- Registrar la evaluación abierta de un estudiante en un grupo específico.

CREATE PROCEDURE sp_evalabi (numpre INT, usuario VARCHAR(45), codgru INT, eval TEXT(2000))
	BEGIN
		DECLARE idest INT;
        SELECT est_ID INTO idest FROM estudiante JOIN persona ON est_ID=per_ID
        WHERE per_Usuario=usuario;
    
		INSERT INTO evaluacion_abierta(pre_Numero, est_ID, gru_Codigo, eva_Calificacion)
        VALUES(numpre, idest, codgru, eval);
        
        UPDATE estudiante
        SET est_Evaluacion = 1
        WHERE est_ID = idest;
    END $$

-- Mostrar los resultados de la evaluación numérica de un profesor en una pregunta específica en un grupo específico

CREATE PROCEDURE sp_calinumerica (numpre INT, usuario VARCHAR(45), codgru INT)
	BEGIN
		DECLARE idprof INT;
        SELECT pro_ID INTO idprof FROM profesor JOIN persona ON pro_ID=per_ID
        WHERE per_Usuario=usuario;
        
        SELECT eva_calificacion, count(eva_calificacion) FROM evaluacion_numerica NATURAL JOIN grupo
		WHERE pro_ID=idprof AND pre_Numero=numpre AND gru_codigo=codgru GROUP BY eva_calificacion;
    END $$

-- Mostrar las calificaciones abiertas de un profesor específico en una pregunta específica

CREATE PROCEDURE sp_caliabierta (numpre INT, usuario VARCHAR(45), codgru INT)
	BEGIN
		DECLARE idprof INT;
        SELECT pro_ID INTO idprof FROM profesor JOIN persona ON pro_ID=per_ID
        WHERE per_Usuario=usuario;
		
		SELECT eva_Calificacion FROM evaluacion_abierta NATURAL JOIN grupo
        WHERE pre_Numero=numpre AND pro_ID=idprof AND gru_codigo=codgru;
    END $$
    
-- Mostrar la calificación promedio de un profesor en todas las preguntas en un periodo académico específico

CREATE PROCEDURE sp_promtotaleval (idprof INT, OUT promedio FLOAT, anho INT, sem INT)
	BEGIN
		SELECT avg(eva_Calificacion) INTO promedio FROM evaluacion_numerica NATURAL JOIN grupo
        WHERE pro_ID=idprof AND gru_Anno=anho AND gru_Semestre=sem;
    END $$
    
-- Agrupar por calificaciones para hacer un diagrama de torta en calificaciones numéricas en una
-- pregunta específica a un profesor específico en un grupo específico
    
CREATE PROCEDURE sp_diagnum (idprof INT, numpre INT, codgru INT)
	BEGIN
		SELECT eva_Calificacion, count(eva_Calificacion) FROM evaluacion_numerica NATURAL JOIN grupo
        WHERE pre_Numero=numpre AND pro_ID=idprof AND codgru
        GROUP BY eva_Calificacion;
    END $$
    
-- Obtener si un profesor existe

CREATE PROCEDURE sp_obtenerprof(nombre VARCHAR(45), apellido VARCHAR(45))
	BEGIN
		SELECT * FROM profesor JOIN persona ON per_ID=pro_ID
        WHERE per_nombres=nombre AND per_apellidos=apellido;
    END $$
    
-- Agregar una pregunta a la tabla Pregunta

CREATE PROCEDURE sp_aggpregunta (descripcion VARCHAR(100), tipo VARCHAR(45), evaluado VARCHAR(45))
	BEGIN
		INSERT INTO pregunta(pre_Descripcion, pre_Tipo, pre_Evaluado) VALUES (descripcion, tipo, evaluado);
    END $$

-- Modificar una pregunta en la tabla pregunta

CREATE PROCEDURE sp_modpregunta (numpre INT, descripcion VARCHAR(100), evaluado VARCHAR(45))
	BEGIN
		UPDATE pregunta
        SET pre_Descripcion=descripcion, pre_Evaluado=evaluado
        WHERE pre_Numero=numpre;
    END $$
    
-- Eliminar una pregunta de la tabla pregunta

CREATE PROCEDURE sp_delpregunta (numpre INT)
	BEGIN
		DELETE FROM pregunta
        WHERE pre_Numero=numpre;
    END $$

DELIMITER ;


-- Asignación de permisos
/*
-- Para Estudiante
GRANT EXECUTE ON PROCEDURE sp_gruposest TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_infoest TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_evalnum TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_evalabi TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_profs TO rol_Estudiante;

-- Para Profesor
GRANT EXECUTE ON PROCEDURE sp_calinumerica TO rol_Profesor;
GRANT EXECUTE ON PROCEDURE sp_caliabierta TO rol_Profesor;
GRANT EXECUTE ON PROCEDURE sp_promtotaleval TO rol_Profesor;

-- Para Directivo
GRANT EXECUTE ON PROCEDURE sp_promtotaleval TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_aggpregunta TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_modpregunta TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_delpregunta TO rol_Directivo;
*/

-- Procedimientos para inserción de Estudiantes y Profesores
DROP PROCEDURE IF EXISTS sp_encuestarealizada;
DROP PROCEDURE IF EXISTS sp_insEstudiante;
DROP PROCEDURE IF EXISTS sp_insProfesor;
DROP FUNCTION IF EXISTS generar_usuario;
DROP FUNCTION IF EXISTS remover_acentos;

-- Verificar si un estudiante realizó la encuesta
DELIMITER $$
CREATE PROCEDURE sp_encuestarealizada(usuario VARCHAR(45))
	BEGIN
		DECLARE idest INT;
        SELECT est_ID INTO idest FROM estudiante JOIN persona ON est_ID=per_ID
        WHERE per_Usuario=usuario;
        
        SELECT est_Evaluacion FROM estudiante WHERE est_ID=idest;
    END $$
    
-- Insertar un estudiante    
CREATE PROCEDURE sp_insEstudiante(nombres VARCHAR(45), apellidos VARCHAR(45), codcarrera INT,
PAPA float, PAPPI float, PA float, grado varchar(45))
	BEGIN
		DECLARE persona_id INT;
        
		INSERT INTO persona(per_Usuario, per_Nombres, per_Apellidos, per_Rol) VALUES 
        (generar_usuario(nombres, apellidos), nombres, apellidos, "Estudiante");
        
        SET persona_id = LAST_INSERT_ID();
        
        INSERT INTO estudiante(est_ID, est_PAPA, est_PAPPI, est_PA, est_Evaluacion, est_Grado, car_Codigo)
        VALUES (persona_id, PAPA, PAPPI, PA, 0, grado, codcarrera);
         
    END $$
    
CREATE PROCEDURE sp_insProfesor(nombres VARCHAR(45), apellidos VARCHAR(45))
	BEGIN
		DECLARE persona_id INT;
        
        INSERT INTO persona(per_Usuario, per_Nombres, per_Apellidos, per_Rol) VALUES 
        (generar_usuario(nombres, apellidos), nombres, apellidos, "Profesor");
        
        SET persona_id = LAST_INSERT_ID();
        
        INSERT INTO profesor(pro_ID) VALUES (persona_id);
	END $$
    
-- Función para generar usuario
CREATE FUNCTION generar_usuario(nombre VARCHAR(45), apellido VARCHAR(45)) RETURNS VARCHAR(10) DETERMINISTIC
	BEGIN
		DECLARE usuario VARCHAR(10);
        START TRANSACTION;
        SET usuario = CONCAT(SUBSTRING(LOWER(nombre), 1, 5), SUBSTRING(LOWER(apellido), 1, 5));
        SET usuario = REPLACE(usuario, ' ', '');
        SET usuario = remover_acentos(usuario);
        SET usuario = LOWER(usuario);
        IF (EXISTS(SELECT per_Usuario FROM persona WHERE per_Usuario=usuario)) THEN
			ROLLBACK;
		ELSE
        RETURN usuario;
        END IF;
        COMMIT;
    END $$

-- Función para eliminar acentos
CREATE FUNCTION remover_acentos(str TEXT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE normalized_str TEXT DEFAULT '';
    DECLARE i INT DEFAULT 1;
    DECLARE len INT DEFAULT CHAR_LENGTH(str);
    DECLARE c CHAR(1);

    WHILE (i <= len) DO
        SET c = SUBSTRING(str, i, 1);

        IF (c REGEXP '[ÁÀÂÄÃ]') THEN
            SET c = 'A';
        ELSEIF (c REGEXP '[áàâäã]') THEN
            SET c = 'a';
        ELSEIF (c REGEXP '[ÉÈÊË]') THEN
            SET c = 'E';
        ELSEIF (c REGEXP '[éèêë]') THEN
            SET c = 'e';
        ELSEIF (c REGEXP '[ÍÌÎÏ]') THEN
            SET c = 'I';
        ELSEIF (c REGEXP '[íìîï]') THEN
            SET c = 'i';
        ELSEIF (c REGEXP '[ÓÒÔÖÕ]') THEN
            SET c = 'O';
        ELSEIF (c REGEXP '[óòôöõ]') THEN
            SET c = 'o';
        ELSEIF (c REGEXP '[ÚÙÛÜ]') THEN
            SET c = 'U';
        ELSEIF (c REGEXP '[úùûü]') THEN
            SET c = 'u';
        ELSEIF (c = 'Ñ') THEN
            SET c = 'N';
        ELSEIF (c = 'ñ') THEN
            SET c = 'n';
        END IF;

        SET normalized_str = CONCAT(normalized_str, c);
        SET i = i + 1;
    END WHILE;

    RETURN normalized_str;
END $$
    
DELIMITER ;