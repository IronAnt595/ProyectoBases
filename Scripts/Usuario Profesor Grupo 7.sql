SET ROLE rol_Profesor;
USE proyecto3;

-- PROFESOR

-- Read
SELECT * FROM vw_Estudiante WHERE est_Carrera='Medicina';
SELECT * FROM Profesor WHERE pro_Apellidos LIKE '%z';
SELECT * FROM vw_SedeFacultad WHERE sed_Nombre='Sede Medellin';
SELECT * FROM vw_asignatura WHERE asi_Créditos=2;
SELECT asi_Nombre FROM vw_AsignaturaGrupo WHERE pro_Nombres='Juan';
-- Create (No permitido)
INSERT INTO vw_Asignatura VALUES (1000004,'Piano I',4, 'Disciplinar Optativa','Facultad de Artes');
-- Delete (No permitido)
DELETE FROM vw_CalificaciónProfesor WHERE pro_ID=1;
-- Update (No permitido)
UPDATE vw_SedeFacultad
SET sed_Nombre='Sede Palmira'
WHERE fac_Nombre='Facultad de Artes';