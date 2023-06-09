SET ROLE rol_Administrativo;
USE proyecto3;

-- COORDINADOR

-- Create 
INSERT INTO profesor VALUES (16,'Martina','Jimenez');
-- Create (No permitido)
INSERT INTO vw_CalificacionAsignatura VALUES ( 2000002,4,3,1,2,5,4,3,5,5,5,'Muy interesante temario');
-- Read
SELECT * FROM grupo WHERE asi_Código=8000001;
-- Update
UPDATE asignatura
SET asi_Nombre='Taller de teatro'
WHERE asi_Código=1000003;

-- Update (No permitido)
UPDATE vw_SedeFacultad
SET sed_Nombre='Sede Palmira'
WHERE fac_Nombre='Facultad de Odontología';

-- Delete (No permitido)
DELETE FROM estudiante WHERE est_ID=30;
-- Delete (No permitido)
DELETE FROM vw_CalificacionProfesor WHERE pro_ID=1;