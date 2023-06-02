-- Creación de procedimientos almacenados
DROP PROCEDURE IF EXISTS sp_gruposest;
DROP PROCEDURE IF EXISTS sp_infoest;
DROP PROCEDURE IF EXISTS sp_evalnum;
DROP PROCEDURE IF EXISTS sp_evalabi;
DROP PROCEDURE IF EXISTS sp_promeval;
DROP PROCEDURE IF EXISTS sp_caliabierta;
DROP PROCEDURE IF EXISTS sp_promtotaleval;
DROP PROCEDURE IF EXISTS sp_infoprof;
DROP PROCEDURE IF EXISTS sp_profs;
DROP PROCEDURE IF EXISTS sp_diagnum;
DROP PROCEDURE IF EXISTS sp_aggpregunta;
DROP PROCEDURE IF EXISTS sp_modpregunta;
DROP PROCEDURE IF EXISTS sp_delpregunta;

-- Obtener la lista de grupos en los que está inscrito un estudiante.
DELIMITER $$
CREATE PROCEDURE sp_gruposest (id INT)
	BEGIN
		SELECT  gru_codigo,asi_Nombre,asi_creditos,pro_Nombres,pro_Apellidos FROM grupo_estudiante NATURAL JOIN grupo NATURAL JOIN profesor NATURAL JOIN asignatura WHERE est_ID=id;
    END $$

-- Obtener la información personal de un estudiante (nombre, apellidos, etc.).

CREATE PROCEDURE sp_infoest (id INT)
	BEGIN
		SELECT est_Nombres, est_Apellidos, est_PAPA, est_PAPPI, est_PA, est_Evaluacion, est_Grado, car_Nombre, fac_Nombre, sed_Nombre FROM estudiante NATURAL JOIN carrera NATURAL JOIN facultad NATURAL JOIN sede WHERE est_ID=id;
    END $$

-- Registrar la evaluación numérica de un estudiante en un grupo específico.

CREATE PROCEDURE sp_evalnum (numpre INT, idest INT, codgru INT, eval INT)
	BEGIN
		INSERT INTO evaluacion_numerica(pre_Numero, est_ID, gru_Codigo, eva_Calificacion)
        VALUES(numpre, idest, codgru, eval);
    END $$

-- Registrar la evaluación abierta de un estudiante en un grupo específico.

CREATE PROCEDURE sp_evalabi (numpre INT, idest INT, codgru INT, eval TEXT(2000))
	BEGIN
		INSERT INTO evaluacion_abierta(pre_Numero, est_ID, gru_Codigo, eva_Calificacion)
        VALUES(numpre, idest, codgru, eval);
    END $$

-- Mostrar el promedio de calificación de un profesor en una pregunta específica

CREATE PROCEDURE sp_promeval (numpre INT, idprof INT, OUT promedio FLOAT)
	BEGIN
		SELECT avg(eva_Calificacion) INTO promedio FROM evaluacion_numerica NATURAL JOIN grupo
        WHERE pre_Numero=numpre AND pro_ID=idprof;
    END $$

-- Mostrar las calificaciones abiertas de un profesor específico en una pregunta específica

CREATE PROCEDURE sp_caliabierta (numpre INT, idprof INT)
	BEGIN
		SELECT eva_Calificacion FROM evaluacion_numerica NATURAL JOIN grupo
        WHERE pre_Numero=numpre AND pro_ID=idprof;
    END $$
    
-- Mostrar la calificación promedio de un profesor en todas las preguntas en un periodo académico específico

CREATE PROCEDURE sp_promtotaleval (idprof INT, OUT promedio FLOAT, anho INT, sem INT)
	BEGIN
		SELECT avg(eva_Calificacion) INTO promedio FROM evaluacion_numerica NATURAL JOIN grupo
        WHERE pro_ID=idprof AND gru_Anno=anho AND gru_Semestre=sem;
    END $$
    
-- Mostrar la información personal del profesor

CREATE PROCEDURE sp_infoprof (idprof INT)
	BEGIN
		SELECT * FROM Profesor;
    END $$

-- Mostrar todos los profesores

CREATE PROCEDURE sp_profs()
	BEGIN
		SELECT pro_Nombres, pro_Apellidos FROM Profesor;
    END $$
    
-- Agrupar por calificaciones para hacer un diagrama de torta en calificaciones numéricas en una
-- pregunta específica a un profesor específico en un grupo específico
    
CREATE PROCEDURE sp_diagnum (idprof INT, numpre INT, codgru INT)
	BEGIN
		SELECT eva_Calificacion, count(eva_Calificacion) FROM evaluacion_numerica NATURAL JOIN grupo
        WHERE pre_Numero=numpre AND pro_ID=idprof AND codgru
        GROUP BY eva_Calificacion;
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

-- Para Estudiante
GRANT EXECUTE ON PROCEDURE sp_gruposest TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_infoest TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_evalnum TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_evalabi TO rol_Estudiante;
GRANT EXECUTE ON PROCEDURE sp_profs TO rol_Estudiante;

-- Para Profesor
GRANT EXECUTE ON PROCEDURE sp_promeval TO rol_Profesor;
GRANT EXECUTE ON PROCEDURE sp_caliabierta TO rol_Profesor;
GRANT EXECUTE ON PROCEDURE sp_promtotaleval TO rol_Profesor;
GRANT EXECUTE ON PROCEDURE sp_infoprof TO rol_Profesor;
GRANT EXECUTE ON PROCEDURE sp_diagnum TO rol_Profesor;

-- Para Directivo
GRANT EXECUTE ON PROCEDURE sp_promtotaleval TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_diagnum TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_aggpregunta TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_modpregunta TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_delpregunta TO rol_Directivo;
GRANT EXECUTE ON PROCEDURE sp_promtotaleval TO rol_Directivo;


-- Procedimientos para inserción de Estudiantes y Profesores
DROP PROCEDURE IF EXISTS sp_insEstudiante;
DROP PROCEDURE IF EXISTS sp_insProfesor;
DROP FUNCTION IF EXISTS generar_usuario;

DELIMITER $$
CREATE PROCEDURE sp_insEstudiante(nombres VARCHAR(45), apellidos VARCHAR(45),
PAPA float, PAPPI float, PA float, grado varchar(45), codcarrera INT)
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
        
        INSERT INTO persona(per_Usuario, per_Nombres, per_Apellido, per_Rol) VALUES 
        (generar_usuario(nombres, apellidos), nombres, apellidos, "Profesor");
        
        SET persona_id = LAST_INSERT_ID();
        
        INSERT INTO profesor(pro_ID) VALUES (persona_id);
	END $$
    
-- Función para generar usuario
CREATE FUNCTION generar_usuario(nombre VARCHAR(45), apellido VARCHAR(45)) RETURNS VARCHAR(10) DETERMINISTIC
	BEGIN
		DECLARE usuario VARCHAR(10);
        SET usuario = CONCAT(SUBSTRING(LOWER(nombre), 1, 5), SUBSTRING(LOWER(apellido), 1, 5));
        SET usuario = REPLACE(usuario, ' ', '');
        RETURN usuario;
    END $$
    
DELIMITER ;
    