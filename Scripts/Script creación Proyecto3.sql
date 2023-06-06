-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS proyecto3 ;
-- CREATE SCHEMA IF NOT EXISTS proyecto3;
USE proyecto3 ;

-- -----------------------------------------------------
-- Table Persona
-- -----------------------------------------------------
DROP TABLE IF EXISTS Evaluacion_Abierta ;
DROP TABLE IF EXISTS Evaluacion_Numerica ;
DROP TABLE IF EXISTS Grupo_Estudiante ;
DROP TABLE IF EXISTS Grupo ;
DROP TABLE IF EXISTS Pregunta ;
DROP TABLE IF EXISTS Profesor ;
DROP TABLE IF EXISTS Asignatura ;
DROP TABLE IF EXISTS Estudiante ;
DROP TABLE IF EXISTS Carrera ;
DROP TABLE IF EXISTS Facultad ;
DROP TABLE IF EXISTS Sede ;
DROP TABLE IF EXISTS Persona ;

CREATE TABLE IF NOT EXISTS Persona (
  per_ID INT NOT NULL AUTO_INCREMENT,
  per_Usuario VARCHAR(45) NOT NULL,
  per_Nombres VARCHAR(45) NOT NULL,
  per_Apellidos VARCHAR(45) NOT NULL,
  per_Rol VARCHAR(45) NOT NULL,
  PRIMARY KEY (per_ID));

-- -----------------------------------------------------
-- Table Sede
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Sede (
  sed_Codigo INT NOT NULL,
  sed_Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (sed_Codigo));


-- -----------------------------------------------------
-- Table Facultad
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Facultad (
  fac_Codigo INT NOT NULL,
  fac_Nombre VARCHAR(90) NOT NULL,
  sed_Codigo INT NOT NULL,
  PRIMARY KEY (fac_Codigo),
  FOREIGN KEY (sed_Codigo)
  REFERENCES Sede (sed_Codigo));


-- -----------------------------------------------------
-- Table Carrera
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Carrera (
  car_Codigo INT NOT NULL,
  car_Nombre VARCHAR(45) NOT NULL,
  fac_Codigo INT NOT NULL,
  PRIMARY KEY (car_Codigo),
  FOREIGN KEY (fac_Codigo)
  REFERENCES Facultad (fac_Codigo));


-- -----------------------------------------------------
-- Table Estudiante
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Estudiante (
  est_ID INT NOT NULL,
  est_PAPA FLOAT NOT NULL,
  est_PAPPI FLOAT NOT NULL,
  est_PA FLOAT NOT NULL,
  est_Evaluacion TINYINT NOT NULL,
  est_Grado VARCHAR(45) NOT NULL,
  car_Codigo INT NOT NULL,
  PRIMARY KEY (est_ID),
  FOREIGN KEY (car_Codigo)
  REFERENCES Carrera (car_Codigo),
  FOREIGN KEY (est_ID)
  REFERENCES Persona (per_ID));


-- -----------------------------------------------------
-- Table Asignatura
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Asignatura (
  asi_Codigo INT NOT NULL,
  asi_Nombre VARCHAR(45) NOT NULL,
  asi_Creditos TINYINT NOT NULL,
  asi_Tipo VARCHAR(45) NOT NULL,
  fac_Codigo INT NOT NULL,
  PRIMARY KEY (asi_Codigo),
  FOREIGN KEY (fac_Codigo)
  REFERENCES Facultad (fac_Codigo));

-- -----------------------------------------------------
-- Table Profesor
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Profesor (
  pro_ID INT NOT NULL,
  PRIMARY KEY (pro_ID),
  FOREIGN KEY (pro_ID)
  REFERENCES Persona (per_ID));


-- -----------------------------------------------------
-- Table Pregunta
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Pregunta (
  pre_Numero INT NOT NULL AUTO_INCREMENT,
  pre_Descripcion VARCHAR(200) NOT NULL,
  pre_Tipo VARCHAR(45) NOT NULL,
  pre_Evaluado VARCHAR(45) NOT NULL,
  PRIMARY KEY (pre_Numero));


-- -----------------------------------------------------
-- Table Grupo
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Grupo (
  gru_Codigo INT NOT NULL AUTO_INCREMENT,
  asi_Codigo INT NOT NULL,
  gru_Numero INT NOT NULL,
  gru_Anno INT NOT NULL,
  gru_Semestre INT NOT NULL,
  pro_ID INT NOT NULL,
  PRIMARY KEY (gru_Codigo),
    FOREIGN KEY (asi_Codigo)
    REFERENCES Asignatura (asi_Codigo),
    FOREIGN KEY (pro_ID)
    REFERENCES Profesor (pro_ID));

-- -----------------------------------------------------
-- Table Grupo_Estudiante
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Grupo_Estudiante (
  est_ID INT NOT NULL,
  gru_Codigo INT NOT NULL,
  PRIMARY KEY (est_ID, gru_Codigo),
    FOREIGN KEY (est_ID)
    REFERENCES Estudiante (est_ID),
    FOREIGN KEY (gru_Codigo)
    REFERENCES Grupo (gru_Codigo));

-- -----------------------------------------------------
-- Table Evaluacion_Numerica
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Evaluacion_Numerica (
  pre_Numero INT NOT NULL,
  est_ID INT NOT NULL,
  gru_Codigo INT NOT NULL,
  eva_Calificacion INT NOT NULL,
  PRIMARY KEY (pre_Numero, est_ID, gru_Codigo),
    FOREIGN KEY (pre_Numero)
    REFERENCES Pregunta (pre_Numero),
    FOREIGN KEY (est_ID , gru_Codigo)
    REFERENCES Grupo_Estudiante (est_ID , gru_Codigo));


-- -----------------------------------------------------
-- Table Evaluacion_Abierta
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Evaluacion_Abierta (
  pre_Numero INT NOT NULL,
  est_ID INT NOT NULL,
  gru_Codigo INT NOT NULL,
  eva_Calificacion TEXT NOT NULL,
  PRIMARY KEY (pre_Numero, est_ID, gru_Codigo),
    FOREIGN KEY (pre_Numero)
    REFERENCES Pregunta (pre_Numero),
    FOREIGN KEY (est_ID , gru_Codigo)
    REFERENCES Grupo_Estudiante (est_ID , gru_Codigo));

