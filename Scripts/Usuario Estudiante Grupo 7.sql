SET ROLE rol_Estudiante;
USE proyecto3;

-- ESTUDIANTE
-- Read
SELECT * FROM vw_Asignatura WHERE fac_Nombre='Facultad de Artes';
-- Create (No permitido)
SELECT * FROM vw_SedeFacultad;
INSERT INTO Calificación_Asignatura VALUES (15, 1000001,4,3,1,2,3,4,3,1,5,2,'Se le podría dar un mejor manejo a la asignatura');
-- Create (No permitido)
INSERT INTO vw_Profesor VALUES ('Juan','Lozano');
-- Update (No permitido)
UPDATE Calificación_Profesor 
SET calpro_Pregunta_Abierta='Ame la metodología de este profesor,totalmente recomendado'
WHERE pro_ID=1 AND est_ID=1;
-- Update (No permitido)
UPDATE vw_SedeFacultad
SET sed_Nombre='Sede Manizales'
WHERE fac_Nombre='Facultad de Medicina';
-- Delete (No permitido)
DELETE FROM Calificación_Profesor WHERE est_ID=28 AND asi_Código=1000001;