-- ----------------------------------------------------------------------------------
-- Sedes
-- ----------------------------------------------------------------------------------
INSERT INTO sede(sed_Codigo, sed_Nombre) VALUES 
(1101,"Bogotá"),
(1102, "Medellín");

-- ----------------------------------------------------------------------------------
-- Facultades
-- ----------------------------------------------------------------------------------
INSERT INTO Facultad (fac_Codigo, fac_Nombre, sed_Codigo) VALUES
(2049, 'Facultad de Artes',1102),
(2050, 'Facultad de Ciencias',1102),
(2728, 'Facultad de Ciencias Agrarias',1102),
(2051, 'Facultad de Ciencias Económicas',1102),
(2052, 'Facultad de Ciencias Humanas',1102),
(2053, 'Facultad de Derecho,Ciencias Políticas y Sociales',1101),
(2054, 'Facultad de Enfermería',1101),
(2055, 'Facultad de Ingeniería',1101),
(2056, 'Facultad de Medicina',1101),
(2057, 'Facultad de Medicina Veterinaria y de Zootecnia',1101),
(2058, 'Facultad de Odontología',1101);

-- ----------------------------------------------------------------------------------
-- Carreras
-- ----------------------------------------------------------------------------------
INSERT INTO carrera(car_Codigo, car_Nombre, fac_Codigo) VALUES
-- Facultad de artes
(1, "Artes Plásticas", 2049),
(2, "Arquitectura", 2049),
(3, "Cine y Televisión", 2049),
-- Facultad de ciencias
(4, "Matemáticas", 2050),
(5, "Estadística", 2050),
(6, "Ingeniería Biológica", 2050),
-- Facultad de ciencias agrarias
(7, "Ingeniería Agronómica", 2728),
-- Facultad de ciencias económicas
(8, "Administración", 2051),
(9, "Contaduría Pública", 2051),
(10, "Economía", 2051),
-- Facultad de ciencias humanas
(11, "Antropología", 2052),
(12, "Filología e Idiomas", 2052),
(13, "Filosofía", 2052),
-- Facultad de derecho
(14, "Derecho", 2053),
(15, "Ciencia Política", 2053),
-- Facultad de enfermería
(16, "Enfermería", 2054),
-- Facultad de Ingeniería
(17, "Ingeniería de Sistemas", 2055),
(18, "Ingeniería Industrial", 2055),
(19, "Ingeniería Química", 2055),
-- Facultad de Medicina
(20, "Fisioterapia", 2056),
(21, "Fonoaudiología", 2056),
(22, "Medicina", 2056),
-- Facultad de Medicina Veterinaria y Zootecnia
(23, "Medicina Veterinaria", 2057),
(24, "Zootecnia", 2057),
-- Facultad de Odontología
(25, "Odontología", 2058);

-- ----------------------------------------------------------------------------------
-- Asignaturas
-- ----------------------------------------------------------------------------------
-- Facultad de Artes
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo)
VALUES (1000001, 'Artes Plásticas', 3, 'Disciplinar Obligatoria', 2049),
       (1000002, 'Historia del Arte', 3, 'Disciplinar Obligatoria', 2049),
       (1000003, 'Taller de Danza', 2, 'Disciplinar Optativa', 2049);

-- Facultad de Ciencias
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo)
VALUES (2000001, 'Cálculo Diferencial e Integral', 4, 'Fund. Obligatoria', 2050),
       (2000002, 'Física General', 4, 'Fund. Obligatoria', 2050),
       (2000003, 'Biología Molecular', 3, 'Disciplinar Optativa', 2050);

-- Facultad de Ciencias Agrarias
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo)
VALUES (3000001, 'Principios de Agronomía', 4, 'Disciplinar Obligatoria', 2728),
       (3000002, 'Producción Pecuaria', 4, 'Disciplinar Obligatoria', 2728),
       (3000003, 'Manejo Sustentable de Suelos', 3, 'Disciplinar Optativa', 2728);

-- Facultad de Ciencias Económicas
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo)
VALUES (4000001, 'Introducción a la Economía', 3, 'Fund. Obligatoria', 2051),
       (4000002, 'Estadística Aplicada', 4, 'Fund. Obligatoria', 2051),
       (4000003, 'Economía Ambiental', 3, 'Disciplinar Optativa', 2051);

-- Facultad de Ciencias Humanas
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo)
VALUES (5000001, 'Historia de la Filosofía', 3, 'Disciplinar Obligatoria', 2052),
       (5000002, 'Lengua y Cultura', 3, 'Disciplinar Obligatoria', 2052),
       (5000003, 'Estudios de Género', 3, 'Disciplinar Optativa', 2052);

-- Facultad de Derecho, Ciencias Políticas y Sociales
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo)
VALUES (6000001, 'Derecho Penal', 4, 'Disciplinar Obligatoria', 2053),
       (6000002, 'Historia de las Ideas Políticas', 3, 'Disciplinar Obligatoria', 2053),
       (6000003, 'Sociología Jurídica', 3, 'Disciplinar Optativa', 2053);

-- Facultad de Enfermeria
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo) VALUES
(7000001, 'Farmacología en Enfermería', 3, 'Disciplinar Obligatoria', 2054),
(7000002, 'Bioética en Enfermería', 2, 'Fund. Obligatoria', 2054),
(7000003, 'Cuidados Paliativos en Enfermería', 4, 'Disciplinar Optativa', 2054);

-- Facultad de Medicina
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo) VALUES
(8000001, 'Anatomía Humana', 6, 'Disciplinar Obligatoria', 2056),
(8000002, 'Fisiología Humana', 6, 'Fund. Obligatoria', 2056),
(8000003, 'Farmacología Médica', 5, 'Disciplinar Obligatoria', 2056);


-- Facultad de Medicina Veterinaria y de Zootecnia
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo) VALUES
(9000001, 'Nutrición Animal', 4, 'Disciplinar Obligatoria', 2057),
(9000002, 'Patología Animal', 6, 'Fund. Obligatoria', 2057),
(9000003, 'Producción Animal', 4, 'Disciplinar Optativa', 2057);

-- Facultad de Ingenieria
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo) VALUES
(1100001, 'Introducción a la Inteligencia Artificial', 4, 'Disciplinar Obligatoria', 2055),
(1100002, 'Diseño de Sistemas Embebidos', 3, 'Disciplinar Optativa', 2055),
(1100003, 'Robótica Avanzada', 4, 'Disciplinar Optativa', 2055);

-- Facultad de Odontología
INSERT INTO Asignatura (asi_Codigo, asi_Nombre, asi_Creditos, asi_Tipo, fac_Codigo) VALUES
(1200001, 'Anatomía dental', 4, 'Disciplinar Obligatoria', 2058),
(1200002, 'Radiología dental', 3, 'Disciplinar Obligatoria', 2058),
(1200003, 'Endodoncia avanzada', 5, 'Disciplinar Optativa', 2058);


-- ----------------------------------------------------------------------------------
-- Profesores
-- ----------------------------------------------------------------------------------

CALL sp_insProfesor('Juan', 'Pérez');
CALL sp_insProfesor('María', 'Gómez');
CALL sp_insProfesor('Carlos', 'López');
CALL sp_insProfesor('Ana', 'Ramírez');
CALL sp_insProfesor('Pedro', 'Sánchez');
CALL sp_insProfesor('Laura', 'García');
CALL sp_insProfesor('Luis', 'González');
CALL sp_insProfesor('Verónica', 'Martínez');
CALL sp_insProfesor('David', 'Díaz');
CALL sp_insProfesor('Elena', 'Fernández');
CALL sp_insProfesor('Santiago', 'Álvarez');
CALL sp_insProfesor('Lucía', 'Hernández');
CALL sp_insProfesor('Jorge', 'Jiménez');
CALL sp_insProfesor('Marta', 'Torres');
CALL sp_insProfesor('Raúl', 'Ruiz');

-- ----------------------------------------------------------------------------------
-- Grupos
-- ----------------------------------------------------------------------------------
INSERT INTO Grupo (asi_Codigo, gru_Numero, pro_ID, gru_Anno, gru_Semestre)
VALUES
-- Asignatura 1000001
(1000001, 1, 1, 2023, 1),
(1000001, 2, 2, 2023, 1),
-- Asignatura 1000002
(1000002, 1, 3, 2023, 1),
(1000002, 2, 4, 2023, 1),
(1000002, 3, 5, 2023, 1),
-- Asignatura 1000003
(1000003, 1, 6, 2023, 1),
-- Asignatura 1100001
(1100001, 1, 7, 2023, 1),
(1100001, 2, 8, 2023, 1),
(1100001, 3, 9, 2023, 1),
(1100001, 4, 10, 2023, 1),
-- Asignatura 1100002
(1100002, 1, 11, 2023, 1),
-- Asignatura 1100003
(1100003, 1, 12, 2023, 1),
-- Asignatura 1200001
(1200001, 1, 13, 2023, 1),
(1200001, 2, 14, 2023, 1),
-- Asignatura 1200002
(1200002, 1, 15, 2023, 1),
-- Asignatura 1200003
(1200003, 1, 1, 2023, 1),
(1200003, 2, 2, 2023, 1),
(1200003, 3, 3, 2023, 1),
-- Asignatura 2000001
(2000001, 1, 4, 2023, 1),
(2000001, 2, 6, 2023, 1),
(2000001, 3, 9, 2023, 1),
(2000001, 4, 11, 2023, 1),
(2000001, 5, 13, 2023, 1),
-- Asignatura 2000002
(2000002, 1, 5, 2023, 1),
-- Asignatura 2000003
(2000003, 1, 6, 2023, 1),
(2000003, 2, 7, 2023, 1),
-- Asignatura 3000001
(3000001, 1, 8, 2023, 1),
(3000001, 2, 9, 2023, 1),
(3000001, 3, 10, 2023, 1),
-- Asignatura 3000002
(3000002, 1, 11, 2023, 1),
(3000002, 2, 12, 2023, 1),
-- Asignatura 3000003
(3000003, 1, 13, 2023, 1),
-- Asignatura 4000001
(4000001, 1, 14, 2023, 1),
(4000001, 2, 15, 2023, 1),
-- Asignatura 4000002
(4000002, 1, 1, 2023, 1),
(4000002, 2, 2, 2023, 1),
-- Asignatura 4000003
(4000003, 1, 6, 2023, 1),
(4000003, 2, 11, 2023, 1),
(4000003, 3, 15, 2023, 1),
-- Asignatura 5000001
(5000001, 1, 7, 2023, 1),
(5000001, 2, 9, 2023, 1),
-- Asignatura 5000002
(5000002, 1, 5, 2023, 1),
(5000002, 2, 10, 2023, 1),
(5000002, 3, 13, 2023, 1),
-- Asignatura 5000003
(5000003, 1, 14, 2023, 1),
-- Asignatura 6000001
(6000001, 1, 1, 2023, 1),
(6000001, 2, 5, 2023, 1),
(6000001, 3, 9, 2023, 1),
-- Asignatura 6000002
(6000002, 1, 6, 2023, 1),
(6000002, 2, 10, 2023, 1),
-- Asignatura 6000003
(6000003, 1, 3, 2023, 1),
(6000003, 2, 7, 2023, 1),
(6000003, 3, 15, 2023, 1),
(6000003, 4, 11, 2023, 1),
-- Asignatura 7000001
(7000001, 1, 12, 2023, 1),
(7000001, 2, 14, 2023, 1),
(7000001, 3, 5, 2023, 1),
-- Asignatura 7000002
(7000002, 1, 8, 2023, 1),
(7000002, 2, 11, 2023, 1),
(7000002, 3, 13, 2023, 1),
-- Asignatura 7000003
(7000003, 1, 4, 2023, 1),
(7000003, 2, 7, 2023, 1),
-- Asignatura 8000001
(8000001, 1, 9, 2023, 1),
(8000001, 2, 10, 2023, 1),
(8000001, 3, 12, 2023, 1),
-- Asignatura 8000002
(8000002, 1, 1, 2023, 1),
(8000002, 2, 2, 2023, 1),
-- Asignatura 8000003
(8000003, 1, 4, 2023, 1),
-- Asignatura 9000001
(9000001, 1, 14, 2023, 1),
(9000001, 2, 8, 2023, 1),
-- Asignatura 9000002
(9000002, 1, 15, 2023, 1),
(9000002, 2, 3, 2023, 1),
-- Asignatura 9000003
(9000003, 1, 10, 2023, 1),
(9000003, 2, 12, 2023, 1);

-- ----------------------------------------------------------------------------------
-- Preguntas
-- ----------------------------------------------------------------------------------
INSERT INTO pregunta(pre_Descripcion, pre_Tipo, pre_Evaluado) VALUES 
('En una escala del 1 al 5, ¿cómo calificaría la calidad de los materiales didácticos utilizados en esta asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría la organización y presentación de los temas en esta asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría la relevancia de los temas tratados en esta asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría el grado de exigencia y rigor académico en esta asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría su grado de interés y motivación hacia el aprendizaje en esta asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría la disponibilidad y la calidad de los recursos adicionales (libros, artículos, videos, etc.) utilizados en esta asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría la efectividad de los métodos de enseñanza y evaluación para satisfacer los objetivos de aprendizaje de la asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría la efectividad de los recursos tecnológicos utilizados en esta asignatura (p. ej., plataforma virtual, proyector, software especializado),?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría la variedad y el interés de los temas y contenidos en esta asignatura?','Numérica', 'Asignatura'),
('En una escala del 1 al 5, ¿cómo calificaría el nivel de dificultad de esta asignatura en relación con su nivel de conocimiento previo del tema?','Numérica', 'Asignatura'),

('En una escala del 1 al 5, ¿cómo calificaría la accesibilidad y disponibilidad de su profesor para brindar apoyo y responder preguntas en esta asignatura?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿cómo calificaría la claridad de las explicaciones y demostraciones en esta asignatura?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿cómo calificaría la cantidad y la calidad de la retroalimentación que recibe de su profesor en esta asignatura?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿El docente preparó adecuadamente cada sesión o actividad?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿El docente mostró agrado y entusiasmo por su labor de enseñanza?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿El docente fue respetuoso con usted y tolerante con sus puntos de vista?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿El docente respetó las reglas y fechas acordadas para las actividades académicas, incluidas las evaluaciones?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿El docente fue justo e imparcial durante las actividades académicas y en las evaluaciones?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿Con este docente aprendió con suficiencia y a profundidad lo tratado en las actividades académicas?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿Inscribiría con gusto otra actividad académica con este docente?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿cómo calificaría su nivel de preparación para enseñar esta materia?', 'Numérica', 'Profesor'),
('En una escala del 1 al 5, ¿cómo calificaría su capacidad para mantener a los estudiantes interesados y motivados en el aula?', 'Numérica', 'Profesor'),

('¿Qué considera que se podría mejorar respecto al diseño, estructura y desarrollo de la asignatura para estudiantes de futuros semestres?', 'Abierta', 'Asignatura'),
('¿Qué podría haber hecho adicionalmente el docente para mejorar su aprendizaje o cuál es el aspecto en el que el docente debería mejorar su proceso de enseñanza?', 'Abierta', 'Profesor');

-- ----------------------------------------------------------------------------------
-- Estudiantes
-- ----------------------------------------------------------------------------------

CALL sp_insEstudiante('Juan', 'Pérez', 2, 3.5, 4.2, 3.9, "Pregrado");
CALL sp_insEstudiante('Ana', 'González', 22, 4.5, 4.8, 4.2, "Pregrado");
CALL sp_insEstudiante('Pedro', 'Martínez', 1, 3.2, 3.8, 3.5, "Pregrado");
CALL sp_insEstudiante('María', 'López', 4, 4.0, 4.2, 3.8, "Pregrado");
CALL sp_insEstudiante('Luis', 'García', 6, 3.8, 4.0, 3.7, "Pregrado");
CALL sp_insEstudiante('Carla', 'Rodríguez', 7, 4.2, 4.5, 4.0, "Pregrado");
CALL sp_insEstudiante('Jorge', 'Hernández', 8, 3.5, 4.0, 3.6, "Pregrado");
CALL sp_insEstudiante('Sofía', 'Vargas', 10, 4.3, 4.5, 4.2, "Pregrado");
CALL sp_insEstudiante('Diego', 'Ramírez', 11, 3.6, 3.9, 3.4, "Pregrado");
CALL sp_insEstudiante('Julia', 'Flores', 12, 4.5, 4.8, 4.0, "Pregrado");
CALL sp_insEstudiante('Miguel', 'Morales', 14, 3.9, 4.2, 3.8, "Pregrado");
CALL sp_insEstudiante('Laura', 'Castillo', 15, 4.0, 4.3, 3.9, "Pregrado");
CALL sp_insEstudiante('Carlos', 'Sánchez', 16, 3.2, 3.7, 3.4, "Pregrado");
CALL sp_insEstudiante('Isabela', 'Pacheco', 17, 4.1, 4.4, 4.0, "Pregrado");
CALL sp_insEstudiante('Andrés', 'Gómez', 19, 3.8, 4.1, 3.7, "Pregrado");
CALL sp_insEstudiante('Gabriela', 'Hernández', 20, 4.0, 4.2, 4.1, "Pregrado");
CALL sp_insEstudiante('Alejandro', 'García', 23, 3.8, 4.1, 3.9, "Pregrado");
CALL sp_insEstudiante('Fernanda', 'Vásquez', 24, 4.2, 4.6, 4.1, "Pregrado");
CALL sp_insEstudiante('Juan Carlos', 'Flores', 25, 4.0, 4.3, 3.9, "Pregrado");
CALL sp_insEstudiante('Rodrigo', 'González', 25, 3.5, 3.9, 3.6, "Pregrado");
CALL sp_insEstudiante('Paola', 'Martínez', 22, 3.9, 4.2, 3.8, "Pregrado");
CALL sp_insEstudiante('Gustavo', 'Sánchez', 22, 4.1, 4.4, 4.0, "Pregrado");
CALL sp_insEstudiante('Diana', 'Ramírez', 16, 4.3, 4.6, 4.2, "Pregrado");
CALL sp_insEstudiante('Jorge Luis', 'Gómez', 7, 3.6, 4.0, 3.5,"Pregrado");
CALL sp_insEstudiante('Laura Daniela', 'Morales', 2, 4.2, 4.5, 4.1, "Pregrado");
CALL sp_insEstudiante('Mariana', 'Castro',  17, 3.7, 4.1, 3.8, "Pregrado");
CALL sp_insEstudiante('Emilio', 'Rodríguez', 19, 4.5, 4.8, 4.2, "Pregrado");
CALL sp_insEstudiante('Karla', 'Pérez', 11, 3.8, 4.1, 3.7, "Pregrado");
CALL sp_insEstudiante('José Luis', 'Hernández', 12, 4.1, 4.4, 4.0, "Pregrado");
CALL sp_insEstudiante('Federico', 'Vargas', 16, 4.5, 4.8, 4.3, "Pregrado");
/*
-- ------------------------
-- REGISTROS (GRUPO ESTUDIANTE)
-- -------------------------
INSERT INTO GrupoEstudiante (asi_Codigo, gru_Numero, est_ID) VALUES
-- asignatura 1000001, 2 grupos
(1000001, 1, 1),
(1000001, 1, 3),
(1000001, 2, 28),
-- asignatura 1000002, 3 grupos
(1000002, 1, 1),
(1000002, 1, 3),
(1000002, 2, 28),
(1000002, 3, 9),
(1000002, 3, 25),
-- asignatura 1000003, 1 grupo
(1000003, 1, 3),
(1000003, 1, 2),
(1000003, 1, 28),
(1000003, 1, 27),
-- asignatura 1100001, 4 grupos
(1100001, 1, 14),
(1100001, 2, 15),
(1100001, 3, 26),
(1100001, 4, 5),
(1100001, 4, 1),
(1100001, 4, 25),
(1100001, 4, 22),
-- asignatura 1100002, 1 grupo
(1100002, 1, 6),
(1100002, 1, 15),
(1100002, 1, 14),
(1100002, 1, 26),
-- asignatura 1100003, 1 grupo
(1100003, 1, 14),
(1100003, 1, 15),
(1100003, 1, 26),
(1100003, 1, 27),
-- asignatura 1200001, 2 grupos
(1200001, 1, 19),
(1200001, 1, 20),
(1200001, 2, 2),
(1200001, 2, 21),
(1200001, 2, 22),
-- asignatura 1200002, 1 grupo
(1200002, 1, 2),
(1200002, 1, 19),
-- asignatura 1200003, 3 grupos
(1200003, 1, 2),
(1200003, 2, 19),
(1200003, 3, 30),
(1200003, 3, 13),
(1200003, 3, 22),
-- asignatura 2000001, 5 grupos
(2000001, 1, 1),
(2000001, 2, 4),
(2000001, 2, 5),
(2000001, 3, 6),
(2000001, 3, 7),
(2000001, 4, 8),
(2000001, 4, 14),
(2000001, 5, 15),
(2000001, 5, 24),
(2000001, 5, 25),
(2000001, 5, 26),
(2000001, 5, 27),
-- asignatura 2000002, 1 grupo
(2000002, 1, 1),
(2000002, 1, 4),
(2000002, 1, 5),
-- asignatura 2000003, 2 grupos
(2000003, 1, 2),
(2000003, 1, 4),
(2000003, 1, 13),
(2000003, 1, 17),
(2000003, 1, 18),
(2000003, 2, 21),
(2000003, 2, 22),

-- asignatura 3000001, 3 grupos
(3000001, 1, 6),
(3000001, 1, 17),
(3000001, 2, 18),
(3000001, 3, 24),

-- asignatura 3000002, 2 grupos
(3000002, 1, 6),
(3000002, 1, 18),
(3000002, 2, 17),
(3000002, 2, 24),

-- asignatura 3000003, 1 grupo
(3000003, 1, 1),
(3000003, 1, 6),
(3000003, 1, 18),
(3000003, 1, 24),
(3000003, 1, 25),

-- asignatura 4000001, 2 grupos
(4000001, 1, 7),
(4000001, 1, 8),
(4000001, 2, 11),
(4000001, 2, 12),

-- asignatura 4000002, 2 grupos
(4000002, 1, 1),
(4000002, 1, 7),
(4000002, 1, 8),
(4000002, 2, 5),

-- asignatura 4000003, 3 grupos
(4000003, 1, 4),
(4000003, 1, 6),
(4000003, 2, 18),
(4000003, 2, 24),
(4000003, 3, 1),

-- asignatura 5000001, 2 grupos
(5000001, 1, 9),
(5000001, 1, 10),
(5000001, 1, 28),
(5000001, 1, 29),
(5000001, 2, 11),
(5000001, 2, 12),

-- asignatura 5000002, 3 grupos
(5000002, 1, 9),
(5000002, 1, 10),
(5000002, 2, 12),
(5000002, 2, 28),
(5000002, 3, 29),

-- asignatura 5000003, 1 grupo
(5000003, 1, 9),
(5000003, 1, 12),
(5000003, 1, 28),

-- asignatura 6000001, 3 grupos
(6000001, 1, 8),
(6000001, 2, 11),
(6000001, 3, 12),

-- asignatura 6000002, 2 grupos
(6000002, 1, 11),
(6000002, 1, 12),
(6000002, 2, 8),
(6000002, 2, 29),


-- asignatura 6000003, 4 grupos
(6000003, 1, 11),
(6000003, 1, 12),
(6000003, 2, 29),
(6000003, 2, 28),
(6000003, 3, 9),
(6000003, 4, 10),

-- asignatura 7000001, 3 grupos
(7000001, 1, 30),
(7000001, 2, 23),
(7000001, 2, 13),
(7000001, 3, 2),

-- asignatura 7000002, 3 grupos
(7000002, 1, 30),
(7000002, 2, 23),
(7000002, 3, 13),
(7000002, 3, 21),

-- asignatura 7000003, 2 grupos
(7000003, 1, 30),
(7000003, 1, 23),
(7000003, 2, 13),
(7000003, 2, 22),

-- asignatura 8000001, 3 grupos
(8000001, 1, 2),
(8000001, 1, 4),
(8000001, 1, 13),
(8000001, 2, 21),
(8000001, 2, 22),
(8000001, 3, 23),
(8000001, 3, 30),

-- asignatura 8000002, 2 grupos
(8000002, 1, 2),
(8000002, 1, 13),
(8000002, 1, 21),
(8000002, 2, 22),
(8000002, 2, 23),
(8000002, 2, 30),

-- asignatura 8000003, 1 grupo
(8000003, 1, 2),
(8000003, 1, 21),
(8000003, 1, 22),

-- asignatura 9000001, 2 grupos
(9000001, 1, 17),
(9000001, 1, 18),
(9000001, 2, 24),
(9000001, 2, 6),

-- asignatura 9000002, 2 grupos
(9000002, 1, 17),
(9000002, 1, 18),
(9000002, 2, 24),
(9000002, 2, 6),

-- asignatura 9000003, 2 grupos
(9000003, 1, 17),
(9000003, 1, 18),
(9000003, 2, 24),
(9000003, 2, 6);

-- ----------------------------------------------------------------------------------
-- Evaluación Numérica
-- ----------------------------------------------------------------------------------
INSERT INTO evaluacion_numerica(pre_Numero, est_ID, gru_Codigo, eva_Calificacion)VALUES
(numpre, idest, codgru, eval),
(1, 1, 1000001, 4),
(1, 28, 1000001, 5),
(1, 1, 1000002, 3),
(1, 28, 1000002, 4),
(1, 25, 1000002, 5),
(1, 2, 1000003, 4),

sp_evalnum (numpre INT, usuario VARCHAR(45), codgru INT, eval INT)
CALL sp_evalnum (*/