USE proyecto3;

-- Creación del rol de Estudiante
DROP ROLE IF EXISTS rol_Estudiante;
CREATE ROLE rol_Estudiante;
GRANT USAGE ON proyecto3.* TO rol_Estudiante;
-- Tabla Estudiante
GRANT SELECT ON proyecto3.Estudiante TO rol_Estudiante;
-- Vista Profesor
GRANT SELECT ON proyecto3.vw_Profesor TO rol_Estudiante;
-- Vista SedeFacultad
GRANT SELECT ON proyecto3.vw_SedeFacultad TO rol_Estudiante;
-- Vista Asignatura
GRANT SELECT ON proyecto3.vw_Asignatura TO rol_Estudiante;
-- Vista AsignaturaGrupo
GRANT SELECT ON proyecto3.vw_AsignaturaGrupo TO rol_Estudiante;
-- Vista EstudianteGrupo
GRANT SELECT ON proyecto3.vw_EstudianteGrupo TO rol_Estudiante;
-- Vista CalificacionAsignaturaAbierta
GRANT SELECT ON proyecto3.vw_CalificacionAsignaturaAbierta TO rol_Estudiante;
-- Vista CalificacionAsignaturaNumerica
GRANT SELECT ON proyecto3.vw_CalificacionAsignaturaNumerica TO rol_Estudiante;
-- Vista CalificacionProfesorAbierta
GRANT SELECT ON proyecto3.vw_CalificacionProfesorAbierta TO rol_Estudiante;
-- Vista CalificacionProfesorNumerica
GRANT SELECT ON proyecto3.vw_CalificacionProfesorNumerica TO rol_Estudiante;


-- Creación de rol de Profesor
DROP ROLE IF EXISTS rol_Profesor;
CREATE ROLE rol_Profesor;
GRANT USAGE ON proyecto3.* TO rol_Profesor;
-- Vista Estudiante
GRANT SELECT ON proyecto3.vw_Estudiante TO rol_Profesor;
-- Tabla Profesor
GRANT SELECT ON proyecto3.Profesor TO rol_Profesor;
-- Vista SedeFacultad
GRANT SELECT ON proyecto3.vw_SedeFacultad TO rol_Profesor;
-- Vista Asignatura
GRANT SELECT ON proyecto3.vw_Asignatura TO rol_Profesor;
-- Vista AsignaturaGrupo
GRANT SELECT ON proyecto3.vw_AsignaturaGrupo TO rol_Profesor;
-- Vista CalificacionAsignaturaAbierta
GRANT SELECT ON proyecto3.vw_CalificacionAsignaturaAbierta TO rol_Profesor;
-- Vista CalificacionAsignaturaNumerica
GRANT SELECT ON proyecto3.vw_CalificacionAsignaturaNumerica TO rol_Profesor;
-- Vista CalificacionProfesorAbierta
GRANT SELECT ON proyecto3.vw_CalificacionProfesorAbierta TO rol_Profesor;
-- Vista CalificacionProfesorNumerica
GRANT SELECT ON proyecto3.vw_CalificacionProfesorNumerica TO rol_Profesor;

-- Creación de rol de Administrativo
DROP ROLE IF EXISTS rol_Administrativo;
CREATE ROLE rol_Administrativo;
GRANT USAGE ON proyecto3.* TO rol_Administrativo;
-- Tabla Estudiante
GRANT INSERT, SELECT, UPDATE, DELETE ON proyecto3.Estudiante TO rol_Administrativo;
-- Tabla Profesor
GRANT INSERT, SELECT, UPDATE, DELETE ON proyecto3.Profesor TO rol_Administrativo;
-- Vista SedeFacultad
GRANT SELECT ON proyecto3.vw_SedeFacultad TO rol_Administrativo;
-- Tabla Asignatura
GRANT INSERT, SELECT, UPDATE, DELETE ON proyecto3.Asignatura TO rol_Administrativo;
-- Tabla Grupo
GRANT INSERT, SELECT, UPDATE, DELETE ON proyecto3.Grupo TO rol_Administrativo;
-- Tabla GrupoEstudiante
GRANT INSERT, SELECT, UPDATE, DELETE ON proyecto3.Grupo_Estudiante TO rol_Administrativo;
-- Vista CalificacionAsignaturaAbierta
GRANT SELECT ON proyecto3.vw_CalificacionAsignaturaAbierta TO rol_Administrativo;
-- Vista CalificacionAsignaturaNumerica
GRANT SELECT ON proyecto3.vw_CalificacionAsignaturaNumerica TO rol_Administrativo;
-- Vista CalificacionProfesorAbierta
GRANT SELECT ON proyecto3.vw_CalificacionProfesorAbierta TO rol_Administrativo;
-- Vista CalificacionProfesorNumerica
GRANT SELECT ON proyecto3.vw_CalificacionProfesorNumerica TO rol_Administrativo;

-- Creación de usuarios

-- Estudiante
DROP USER IF EXISTS 'Estudiante'@'localhost';
CREATE USER 'Estudiante'@'localhost' IDENTIFIED BY 'estudiante';
GRANT rol_Estudiante TO 'Estudiante'@'localhost';

-- Profesor
DROP USER IF EXISTS 'Profesor'@'localhost';
CREATE USER 'Profesor'@'localhost' IDENTIFIED BY 'profesor';
GRANT rol_Profesor TO 'Profesor'@'localhost';

-- Coordinador
DROP USER IF EXISTS 'Administrativo'@'localhost';
CREATE USER 'Administrativo'@'localhost' IDENTIFIED BY 'administrativo';
GRANT rol_Administrativo TO 'Administrativo'@'localhost';
