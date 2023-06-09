USE proyecto3;

-- Consultas:
-- a. Mostrar el número de estudiantes en cada carrera y su promedio de calificación en la pregunta 11 de la evaluación del profesor:
SELECT car_Nombre, AVG(eva_Calificacion) AS Promedio, COUNT(est_ID) AS Cantidad FROM estudiante NATURAL JOIN carrera NATURAL JOIN grupo_estudiante NATURAL JOIN evaluacion_numerica NATURAL JOIN pregunta
WHERE pre_Evaluado='Profesor' AND pre_Numero=11
GROUP BY car_Codigo;

-- b. Consulta que muestra el promedio de calificaciones de cada profesor en todas las asignaturas:
SELECT per_Nombres, per_Apellidos, avg(eva_Calificacion)
FROM persona JOIN profesor NATURAL JOIN grupo NATURAL JOIN evaluacion_numerica on pro_ID=per_ID
GROUP BY per_ID;

-- c. Consulta que muestra la cantidad de estudiantes que han evaluado a cada profesor, filtrando por aquellos que tienen al menos 3 evaluaciones:
SELECT per_Nombres, per_Apellidos, COUNT(est_ID) FROM persona JOIN profesor ON per_ID=pro_ID NATURAL JOIN grupo NATURAL JOIN evaluacion_numerica
WHERE pre_numero=1
GROUP BY per_ID
HAVING COUNT(est_ID)>=6;

-- d. Consulta que muestra el promedio de la PAPA (Promedio Aritmético Ponderado Acumulado) de los estudiantes de cada carrera:
SELECT car_Nombre, AVG(est_PAPA) AS promedio_PAPA
FROM Estudiante NATURAL JOIN carrera
GROUP BY car_Nombre;

-- e. Consulta que muestra el promedio de la pregunta 2 de la calificación de cada asignatura, filtrando por aquellas que pertenecen a la Facultad de Ingeniería:
SELECT asi_Nombre, AVG(eva_Calificacion) FROM evaluacion_numerica NATURAL JOIN grupo NATURAL JOIN asignatura NATURAL JOIN facultad
WHERE pre_Numero=2 AND fac_Nombre='Facultad de Ingeniería'
GROUP BY asi_Codigo;

-- f. Consultar los estudiantes de Ingeniería de Sistemas y Computación o Medicina que hayan presentado la evaluación docente:
SELECT per_ID, per_Nombres, per_Apellidos
FROM Estudiante JOIN persona ON per_ID=est_ID NATURAL JOIN carrera
WHERE (car_Nombre = 'Ingeniería de Sistemas y Computación' or car_Nombre = 'Medicina') and est_Evaluacion = 1;

-- g. Realizar una consulta para obtener los nombres de las asignaturas y el número total de estudiantes matriculados en cada una de ellas:
SELECT asi_Nombre, count(est_ID) AS TotalEstudiantes
FROM grupo NATURAL JOIN grupo_estudiante NATURAL JOIN asignatura
GROUP BY asi_Codigo;

-- h. Mostrar el nombre de la sede y la cantidad de facultades asociadas a cada sede:
SELECT 
  s.sed_Nombre AS Nombre_Sede, 
  COUNT(DISTINCT f.fac_Codigo) AS Cantidad_Facultades
FROM Sede s
LEFT JOIN Facultad f ON s.sed_Codigo = f.sed_Codigo
GROUP BY s.sed_Nombre;

-- i. Realizar una consulta para obtener los nombres de los profesores y el promedio de las calificaciones obtenidas en la pregunta 5 sólo para aquellos que tengan un promedio mayor a 3:
SELECT per_Nombres, per_apellidos, AVG(eva_calificacion) AS 'Promedio Pregunta 5' 
FROM profesor JOIN persona ON per_ID=pro_ID NATURAL JOIN grupo NATURAL JOIN evaluacion_numerica
WHERE pre_Numero=5
GROUP BY per_ID
HAVING AVG(eva_calificacion) > 3;

-- j. Obtener la cantidad total de créditos de las asignaturas ofrecidas por las facultades:
SELECT fac.fac_Nombre, SUM(asi.asi_Creditos) AS Total_Créditos
FROM Facultad fac
INNER JOIN Asignatura asi ON asi.fac_Codigo = fac.fac_Codigo
GROUP BY fac.fac_Codigo;



