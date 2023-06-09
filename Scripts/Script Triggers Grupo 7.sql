-- Creación de triggers
DROP TRIGGER IF EXISTS tr_evaluacionestudiante;

-- Coloca en 1 la columna de evaluación de estudiante cuando este realiza una evaluación

DELIMITER $$
CREATE TRIGGER tr_evaluacionestudiante AFTER INSERT ON evaluacion_numerica
FOR EACH ROW
	BEGIN
		DECLARE idest INT;
        SET idest = NEW.est_ID;
        UPDATE estudiante
        SET est_Evaluacion=1
        WHERE est_ID=idest;
    END $$
DELIMITER ;