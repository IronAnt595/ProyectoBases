-- Creación de vistas
USE proyecto3;

-- Creación de vista vw_Profesor
DROP VIEW IF EXISTS vw_Profesor;
CREATE VIEW vw_Profesor AS SELECT per_Nombres, per_Apellidos FROM profesor JOIN persona ON pro_ID=per_ID;

-- Creación de vista vw_SedeFacultad
DROP VIEW IF EXISTS vw_SedeFacultad;
CREATE VIEW vw_SedeFacultad AS
SELECT fac_Nombre, sed_Nombre FROM facultad NATURAL JOIN sede;

-- Creación de vista vw_Asignatura
DROP VIEW IF EXISTS vw_Asignatura;
CREATE VIEW vw_Asignatura AS
SELECT asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Nombre
FROM asignatura NATURAL JOIN facultad;

-- Creación de vista vw_AsignaturaGrupo
DROP VIEW IF EXISTS vw_AsignaturaGrupo;
CREATE VIEW vw_AsignaturaGrupo AS
SELECT asi_Codigo, asi_Nombre, gru_Numero, CONCAT(gru_Anno,'-', gru_Semestre) AS periodo, per_Nombres, per_Apellidos
FROM asignatura NATURAL JOIN grupo NATURAL JOIN profesor JOIN persona ON per_ID=pro_ID;

-- Creación de vista vw_EstudianteGrupo
DROP VIEW IF EXISTS vw_EstudianteGrupo;
CREATE VIEW vw_EstudianteGrupo AS
SELECT asi_Codigo, asi_Nombre, gru_Codigo, per_Nombres, per_Apellidos
FROM grupo_estudiante NATURAL JOIN estudiante NATURAL JOIN asignatura JOIN persona ON per_ID=est_ID;

-- Creación de vista vw_Estudiante
DROP VIEW IF EXISTS vw_Estudiante;
CREATE VIEW vw_Estudiante AS
SELECT per_Nombres, per_Apellidos, car_Nombre FROM estudiante NATURAL JOIN carrera JOIN persona ON per_ID=est_ID;

-- Creación de vista vw_CalificaciónAsignaturaAbierta
DROP VIEW IF EXISTS vw_CalificacionAsignaturaAbierta;
CREATE VIEW vw_CalificacionAsignaturaAbierta AS
SELECT * FROM evaluacion_abierta NATURAL JOIN pregunta WHERE pre_Evaluado='Asignatura';

-- Creación de vista vw_CalificaciónAsignaturaNumerica
DROP VIEW IF EXISTS vw_CalificacionAsignaturaNumerica;
CREATE VIEW vw_CalificacionAsignaturaNumerica AS
SELECT * FROM evaluacion_numerica NATURAL JOIN pregunta WHERE pre_Evaluado='Asignatura';

-- Creación de vista vw_CalificaciónProfesorAbierta
DROP VIEW IF EXISTS vw_CalificacionProfesorAbierta;
CREATE VIEW vw_CalificacionProfesorAbierta AS
SELECT * FROM evaluacion_abierta NATURAL JOIN pregunta WHERE pre_Evaluado='Profesor';

-- Creación de vista vw_CalificaciónProfesorNumerica
DROP VIEW IF EXISTS vw_CalificacionProfesorNumerica;
CREATE VIEW vw_CalificacionProfesorNumerica AS
SELECT * FROM evaluacion_numerica NATURAL JOIN pregunta WHERE pre_Evaluado='Profesor';

-- Muestra de datos
SELECT * FROM vw_Profesor;
SELECT * FROM vw_SedeFacultad;
SELECT * FROM vw_Asignatura;
SELECT * FROM vw_AsignaturaGrupo;
SELECT * FROM vw_EstudianteGrupo;
SELECT * FROM vw_Estudiante;
SELECT * FROM vw_CalificacionAsignaturaAbierta;
SELECT * FROM vw_CalificacionAsignaturaNumerica;
SELECT * FROM vw_CalificacionProfesorAbierta;
SELECT * FROM vw_CalificacionProfesorNumerica;