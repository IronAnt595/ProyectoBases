-- Creación Índices
USE proyecto3;
-- Creación de índices en tabla de Estudiante

-- Creación de índice único para usuario
ALTER TABLE estudiante
	ADD UNIQUE INDEX idx_Usuario (est_Usuario);

-- Creación de índice para carrera
ALTER TABLE estudiante
	ADD INDEX idx_Carrera (est_Carrera);
    
-- Creación de índices en tabla Profesor

-- Creación de índice único para usuario
ALTER TABLE profesor
	ADD UNIQUE INDEX idx_Usuario (pro_Usuario);

-- Creación de índices para tabla Grupo

-- Creación de índice único para código de asignatura y número de grupo
ALTER TABLE grupo
	ADD UNIQUE INDEX idx_AsigNum (asi_Código, gru_Número);
    
