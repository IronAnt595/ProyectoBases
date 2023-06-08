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

-- ----------------------------------------------------------------------------------
-- Profesores
-- ----------------------------------------------------------------------------------

CALL sp_insProfesor('Rodrigo', 'Pérez');
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
(1000001, 1, 31, 2023, 1),
(1000001, 2, 32, 2023, 1),
-- Asignatura 1000002
(1000002, 1, 33, 2023, 1),
(1000002, 2, 34, 2023, 1),
(1000002, 3, 35, 2023, 1),
-- Asignatura 1000003
(1000003, 1, 36, 2023, 1),
-- Asignatura 1100001
(1100001, 1, 37, 2023, 1),
(1100001, 2, 38, 2023, 1),
(1100001, 3, 39, 2023, 1),
(1100001, 4, 40, 2023, 1),
-- Asignatura 1100002
(1100002, 1, 41, 2023, 1),
-- Asignatura 1100003
(1100003, 1, 42, 2023, 1),
-- Asignatura 1200001
(1200001, 1, 43, 2023, 1),
(1200001, 2, 44, 2023, 1),
-- Asignatura 1200002
(1200002, 1, 45, 2023, 1),
-- Asignatura 1200003
(1200003, 1, 31, 2023, 1),
(1200003, 2, 32, 2023, 1),
(1200003, 3, 33, 2023, 1),
-- Asignatura 2000001
(2000001, 1, 34, 2023, 1),
(2000001, 2, 36, 2023, 1),
(2000001, 3, 39, 2023, 1),
(2000001, 4, 41, 2023, 1),
(2000001, 5, 43, 2023, 1),
-- Asignatura 2000002
(2000002, 1, 35, 2023, 1),
-- Asignatura 2000003
(2000003, 1, 36, 2023, 1),
(2000003, 2, 37, 2023, 1),
-- Asignatura 3000001
(3000001, 1, 38, 2023, 1),
(3000001, 2, 39, 2023, 1),
(3000001, 3, 40, 2023, 1),
-- Asignatura 3000002
(3000002, 1, 41, 2023, 1),
(3000002, 2, 42, 2023, 1),
-- Asignatura 3000003
(3000003, 1, 43, 2023, 1),
-- Asignatura 4000001
(4000001, 1, 44, 2023, 1),
(4000001, 2, 45, 2023, 1),
-- Asignatura 4000002
(4000002, 1, 31, 2023, 1),
(4000002, 2, 32, 2023, 1),
-- Asignatura 4000003
(4000003, 1, 36, 2023, 1),
(4000003, 2, 41, 2023, 1),
(4000003, 3, 45, 2023, 1),
-- Asignatura 5000001
(5000001, 1, 37, 2023, 1),
(5000001, 2, 39, 2023, 1),
-- Asignatura 5000002
(5000002, 1, 35, 2023, 1),
(5000002, 2, 40, 2023, 1),
(5000002, 3, 43, 2023, 1),
-- Asignatura 5000003
(5000003, 1, 44, 2023, 1),
-- Asignatura 6000001
(6000001, 1, 31, 2023, 1),
(6000001, 2, 35, 2023, 1),
(6000001, 3, 39, 2023, 1),
-- Asignatura 6000002
(6000002, 1, 36, 2023, 1),
(6000002, 2, 40, 2023, 1),
-- Asignatura 6000003
(6000003, 1, 33, 2023, 1),
(6000003, 2, 37, 2023, 1),
(6000003, 3, 45, 2023, 1),
(6000003, 4, 41, 2023, 1),
-- Asignatura 7000001
(7000001, 1, 42, 2023, 1),
(7000001, 2, 44, 2023, 1),
(7000001, 3, 35, 2023, 1),
-- Asignatura 7000002
(7000002, 1, 38, 2023, 1),
(7000002, 2, 41, 2023, 1),
(7000002, 3, 43, 2023, 1),
-- Asignatura 7000003
(7000003, 1, 34, 2023, 1),
(7000003, 2, 37, 2023, 1),
-- Asignatura 8000001
(8000001, 1, 39, 2023, 1),
(8000001, 2, 40, 2023, 1),
(8000001, 3, 42, 2023, 1),
-- Asignatura 8000002
(8000002, 1, 31, 2023, 1),
(8000002, 2, 32, 2023, 1),
-- Asignatura 8000003
(8000003, 1, 34, 2023, 1),
-- Asignatura 9000001
(9000001, 1, 44, 2023, 1),
(9000001, 2, 38, 2023, 1),
-- Asignatura 9000002
(9000002, 1, 45, 2023, 1),
(9000002, 2, 33, 2023, 1),
-- Asignatura 9000003
(9000003, 1, 40, 2023, 1),
(9000003, 2, 42, 2023, 1);

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

SELECT * FROM estudiante;
SELECT * FROM grupo;

-- ------------------------
-- REGISTROS (GRUPO ESTUDIANTE)
-- -------------------------
INSERT INTO Grupo_Estudiante (gru_Codigo, est_ID) VALUES
        -- asignatura 1000001, 2 grupos
        (1, 1),
        (1, 3),
        (2, 28),
        -- asignatura 1000002, 3 grupos
        (3, 1),
        (3, 3),
        (4, 28),
        (5, 9),
        (5, 25),
        -- asignatura 1000003, 1 grupo
        (6, 3),
        (6, 2),
        (6, 28),
        (6, 27),
        -- asignatura 1100001, 4 grupos
        (7, 14),
        (8, 15),
        (9, 26),
        (10, 5),
        (10, 1),
        (10, 25),
        (10, 22),
        -- asignatura 1100002, 1 grupo
        (11, 6),
        (11, 15),
        (11, 14),
        (11, 26),
        -- asignatura 1100003, 1 grupo
        (12, 14),
        (12, 15),
        (12, 26),
        (12, 27),
        -- asignatura 1200001, 2 grupos
        (13, 19),
        (13, 20),
        (14, 2),
        (14, 21),
        (14, 22),
        -- asignatura 1200002, 1 grupo
        (15, 2),
        (15, 19),
        -- asignatura 1200003, 3 grupos
        (16, 2),
        (17, 19),
        (18, 30),
        (18, 13),
        (18, 22),
        -- asignatura 2000001, 5 grupos
        (19, 1),
        (20, 4),
        (20, 5),
        (21, 6),
        (21, 7),
        (22, 8),
        (22, 14),
        (23, 15),
        (23, 24),
        (23, 25),
        (23, 26),
        (23, 27),
        -- asignatura 2000002, 1 grupo
        (24, 1),
        (24, 4),
        (24, 5),
        -- asignatura 2000003, 2 grupos
        (25, 2),
        (25, 4),
        (25, 13),
        (25, 17),
        (25, 18),
        (26, 21),
        (26, 22),

        -- asignatura 3000001, 3 grupos
        (27, 6),
        (27, 17),
        (28, 18),
        (29, 24),

        -- asignatura 3000002, 2 grupos
        (30, 6),
        (30, 18),
        (31, 17),
        (31, 24),

        -- asignatura 3000003, 1 grupo
        (32, 1),
        (32, 6),
        (32, 18),
        (32, 24),
        (32, 25),

        -- asignatura 4000001, 2 grupos
        (33, 7),
        (33, 8),
        (34, 11),
        (34, 12),

        -- asignatura 4000002, 2 grupos
        (35, 1),
        (35, 7),
        (35, 8),
        (36, 5),

        -- asignatura 4000003, 3 grupos
        (37, 4),
        (37, 6),
        (38, 18),
        (38, 24),
        (39, 1),

        -- asignatura 5000001, 2 grupos
        (40, 9),
        (40, 10),
        (40, 28),
        (40, 29),
        (41, 11),
        (41, 12),

        -- asignatura 5000002, 3 grupos
        (42, 9),
        (42, 10),
        (43, 12),
        (43, 28),
        (44, 29),

        -- asignatura 5000003, 1 grupo
        (45, 9),
        (45, 12),
        (45, 28),

        -- asignatura 6000001, 3 grupos
        (46, 8),
        (47, 11),
        (48, 12),

        -- asignatura 6000002, 2 grupos
        (49, 11),
        (49, 12),
        (50, 8),
        (50, 29),


        -- asignatura 6000003, 4 grupos
        (51, 11),
        (51, 12),
        (52, 29),
        (52, 28),
        (53, 9),
        (54, 10),

        -- asignatura 7000001, 3 grupos
        (55, 30),
        (56, 23),
        (56, 13),
        (57, 2),

        -- asignatura 7000002, 3 grupos
        (58, 30),
        (59, 23),
        (60, 13),
        (60, 21),

        -- asignatura 7000003, 2 grupos
        (61, 30),
        (61, 23),
        (62, 13),
        (62, 22),

        -- asignatura 8000001, 3 grupos
        (63, 2),
        (63, 4),
        (63, 13),
        (64, 21),
        (64, 22),
        (65, 23),
        (65, 30),

        -- asignatura 8000002, 2 grupos
        (66, 2),
        (66, 13),
        (66, 21),
        (67, 22),
        (67, 23),
        (67, 30),

        -- asignatura 8000003, 1 grupo
        (68, 2),
        (68, 21),
        (68, 22),

        -- asignatura 9000001, 2 grupos
        (69, 17),
        (69, 18),
        (70, 24),
        (70, 6),

        -- asignatura 9000002, 2 grupos
        (71, 17),
        (71, 18),
        (72, 24),
        (72, 6),

        -- asignatura 9000003, 2 grupos
        (73, 17),
        (73, 18),
        (74, 24),
        (74, 6);