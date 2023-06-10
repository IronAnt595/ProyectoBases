-- Creación de triggers
DROP TRIGGER IF EXISTS tr_evaluacionestudiantenumerica;
DROP TRIGGER IF EXISTS tr_evaluacionestudianteabierta;

-- Coloca en 1 la columna de evaluación de estudiante cuando este realiza una evaluación

DELIMITER $$
CREATE TRIGGER tr_evaluacionestudiantenumerica AFTER INSERT ON evaluacion_numerica
FOR EACH ROW
	BEGIN
		DECLARE idest INT;
        SET idest = NEW.est_ID;
        UPDATE estudiante
        SET est_Evaluacion=1
        WHERE est_ID=idest;
    END $$
    
CREATE TRIGGER tr_evaluacionestudianteabierta AFTER INSERT ON evaluacion_abierta
FOR EACH ROW
	BEGIN
		DECLARE idest INT;
        SET idest = NEW.est_ID;
        UPDATE estudiante
        SET est_Evaluacion=1
        WHERE est_ID=idest;
    END $$
DELIMITER ;