-- Creación Índices
USE proyecto3;
-- Creación de índices en tabla de Persona

-- Creación de índice único para usuario

ALTER TABLE persona
	ADD UNIQUE INDEX idx_Usuario (per_Usuario);

-- Creación de índices para tabla Grupo

-- Creación de índice único para código de asignatura y número de grupo

ALTER TABLE grupo
	ADD UNIQUE INDEX idx_AsigNum (asi_Codigo, gru_Numero);
    
