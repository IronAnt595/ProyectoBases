# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser


class Asignatura(models.Model):
    asi_codigo = models.IntegerField(db_column='asi_Codigo', primary_key=True)  # Field name made lowercase.
    asi_nombre = models.CharField(db_column='asi_Nombre', max_length=45)  # Field name made lowercase.
    asi_creditos = models.IntegerField(db_column='asi_Creditos')  # Field name made lowercase.
    asi_tipo = models.CharField(db_column='asi_Tipo', max_length=45)  # Field name made lowercase.
    fac_codigo = models.ForeignKey('Facultad', models.DO_NOTHING, db_column='fac_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'asignatura'


class CalificacionAsignatura(models.Model):
    est = models.ForeignKey('Estudiante', models.DO_NOTHING, db_column='est_ID')  # Field name made lowercase.
    asi_codigo = models.OneToOneField(Asignatura, models.DO_NOTHING, db_column='asi_Codigo', primary_key=True)  # Field name made lowercase. The composite primary key (asi_Codigo, est_ID) found, that is not supported. The first column is selected.
    calasi_pregunta_1 = models.IntegerField(db_column='calasi_Pregunta_1', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la calidad de los materiales didßcticos utilizados en esta asignatura?\n')  # Field name made lowercase.
    calasi_pregunta_2 = models.IntegerField(db_column='calasi_Pregunta_2', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la organizaci¾n y presentaci¾n de los temas en esta asignatura?')  # Field name made lowercase.
    calasi_pregunta_3 = models.IntegerField(db_column='calasi_Pregunta_3', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la relevancia de los temas tratados en esta asignatura?')  # Field name made lowercase.
    calasi_pregunta_4 = models.IntegerField(db_column='calasi_Pregunta_4', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa el grado de exigencia y rigor acadÚmico en esta asignatura?\n')  # Field name made lowercase.
    calasi_pregunta_5 = models.IntegerField(db_column='calasi_Pregunta_5', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa su grado de interÚs y motivaci¾n hacia el aprendizaje en esta asignatura?')  # Field name made lowercase.
    calasi_pregunta_6 = models.IntegerField(db_column='calasi_Pregunta_6', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la disponibilidad y la calidad de los recursos adicionales (libros, artÝculos, videos, etc.) utilizados en esta asignatura?\n')  # Field name made lowercase.
    calasi_pregunta_7 = models.IntegerField(db_column='calasi_Pregunta_7', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la efectividad de los mÚtodos de ense±anza y evaluaci¾n para satisfacer los objetivos de aprendizaje de la asignatura?')  # Field name made lowercase.
    calasi_pregunta_8 = models.IntegerField(db_column='calasi_Pregunta_8', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la efectividad de los recursos tecnol¾gicos utilizados en esta asignatura (p. ej., plataforma virtual, proyector, software especializado)?')  # Field name made lowercase.
    calasi_pregunta_9 = models.IntegerField(db_column='calasi_Pregunta_9', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la variedad y el interÚs de los temas y contenidos en esta asignatura?')  # Field name made lowercase.
    calasi_pregunta_10 = models.IntegerField(db_column='calasi_Pregunta_10', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa el nivel de dificultad de esta asignatura en relaci¾n con su nivel de conocimiento previo del tema?\n')  # Field name made lowercase.
    calasi_pregunta_abierta = models.TextField(db_column='calasi_Pregunta_Abierta', db_comment='┐QuÚ considera que se podrÝa mejorar respecto al dise±o, estructura y desarrollo de la asignatura para estudiantes de futuros semestres?')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'calificacion_asignatura'
        unique_together = (('asi_codigo', 'est'),)


class CalificacionProfesor(models.Model):
    pro = models.OneToOneField('Profesor', models.DO_NOTHING, db_column='pro_ID', primary_key=True)  # Field name made lowercase. The composite primary key (pro_ID, est_ID) found, that is not supported. The first column is selected.
    est = models.ForeignKey('Estudiante', models.DO_NOTHING, db_column='est_ID')  # Field name made lowercase.
    calpro_pregunta_1 = models.IntegerField(db_column='calpro_Pregunta_1', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la accesibilidad y disponibilidad de su profesor para brindar apoyo y responder preguntas en esta asignatura?')  # Field name made lowercase.
    calpro_pregunta_2 = models.IntegerField(db_column='calpro_Pregunta_2', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la claridad de las explicaciones y demostraciones en esta asignatura?')  # Field name made lowercase.
    calpro_pregunta_3 = models.IntegerField(db_column='calpro_Pregunta_3', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa la cantidad y la calidad de la retroalimentaci¾n que recibe de su profesor en esta asignatura?')  # Field name made lowercase.
    calpro_pregunta_4 = models.IntegerField(db_column='calpro_Pregunta_4', db_comment='En una escala del 1 al 5, ┐El docente prepar¾ adecuadamente cada sesi¾n o actividad?')  # Field name made lowercase.
    calpro_pregunta_5 = models.IntegerField(db_column='calpro_Pregunta_5', db_comment='En una escala del 1 al 5, ┐El docente mostr¾ agrado y entusiasmo por su labor de ense±anza?')  # Field name made lowercase.
    calpro_pregunta_6 = models.IntegerField(db_column='calpro_Pregunta_6', db_comment='En una escala del 1 al 5, ┐El docente fue respetuoso con usted y tolerante con sus puntos de vista?\n')  # Field name made lowercase.
    calpro_pregunta_7 = models.IntegerField(db_column='calpro_Pregunta_7', db_comment='En una escala del 1 al 5,\n┐El docente respet¾ las reglas y fechas acordadas para las actividades acadÚmicas, incluidas las evaluaciones?\n')  # Field name made lowercase.
    calpro_pregunta_8 = models.IntegerField(db_column='calpro_Pregunta_8', db_comment='En una escala del 1 al 5, ┐el docente fue justo e imparcial durante las actividades acadÚmicas y en las evaluaciones?')  # Field name made lowercase.
    calpro_pregunta_9 = models.IntegerField(db_column='calpro_Pregunta_9', db_comment='En una escala del 1 al 5,┐Con este docente aprendi¾ con suficiencia y a profundidad lo tratado en las actividades acadÚmicas?\n')  # Field name made lowercase.
    calpro_pregunta_10 = models.IntegerField(db_column='calpro_Pregunta_10', db_comment='En una escala del 1 al 5, ┐InscribirÝa con gusto otra actividad acadÚmica con este docente?')  # Field name made lowercase.
    calpro_pregunta_11 = models.IntegerField(db_column='calpro_Pregunta_11', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa su nivel de preparaci¾n para ense±ar esta materia?')  # Field name made lowercase.
    calpro_pregunta_12 = models.IntegerField(db_column='calpro_Pregunta_12', db_comment='En una escala del 1 al 5, ┐c¾mo calificarÝa su capacidad para mantener a los estudiantes interesados y motivados en el aula?')  # Field name made lowercase.
    calpro_pregunta_abierta = models.TextField(db_column='calpro_Pregunta_Abierta', db_comment='┐QuÚ podrÝa haber hecho adicionalmente el docente para mejorar su aprendizaje o cußl es el aspecto en el que el docente deberÝa mejorar su proceso de ense±anza?')  # Field name made lowercase.
    calpro_pregunta15 = models.IntegerField(db_column='calpro_Pregunta15', blank=True, null=True, db_comment='Pregunta nueva')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'calificacion_profesor'
        unique_together = (('pro', 'est'),)


class Estudiante(models.Model):
    est_id = models.AutoField(db_column='est_ID', primary_key=True)  # Field name made lowercase.
    est_usuario = models.OneToOneField( settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    est_nombres = models.CharField(db_column='est_Nombres', max_length=45)  # Field name made lowercase.
    est_apellidos = models.CharField(db_column='est_Apellidos', max_length=45)  # Field name made lowercase.
    est_carrera = models.CharField(db_column='est_Carrera', max_length=45)  # Field name made lowercase.
    est_papa = models.FloatField(db_column='est_PAPA')  # Field name made lowercase.
    est_pappi = models.FloatField(db_column='est_PAPPI')  # Field name made lowercase.
    est_pa = models.FloatField(db_column='est_PA')  # Field name made lowercase.
    est_evaluacion = models.IntegerField(db_column='est_Evaluacion')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'estudiante'


class Facultad(models.Model):
    fac_codigo = models.IntegerField(db_column='fac_Codigo', primary_key=True)  # Field name made lowercase.
    fac_nombre = models.CharField(db_column='fac_Nombre', max_length=60)  # Field name made lowercase.
    sed_codigo = models.ForeignKey('Sede', models.DO_NOTHING, db_column='sed_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'facultad'


class Grupo(models.Model):
    asi_codigo = models.OneToOneField(Asignatura, models.DO_NOTHING, db_column='asi_Codigo', primary_key=True)  # Field name made lowercase. The composite primary key (asi_Codigo, gru_Numero) found, that is not supported. The first column is selected.
    gru_numero = models.IntegerField(db_column='gru_Numero')  # Field name made lowercase.
    pro = models.ForeignKey('Profesor', models.DO_NOTHING, db_column='pro_ID')  # Field name made lowercase.
    gru_anno = models.SmallIntegerField(db_column='gru_Anno')  # Field name made lowercase.
    gru_semestre = models.IntegerField(db_column='gru_Semestre')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'grupo'
        unique_together = (('asi_codigo', 'gru_numero'),)


class Grupoestudiante(models.Model):
    asi_codigo = models.OneToOneField(Grupo, models.DO_NOTHING, db_column='asi_Codigo', primary_key=True)  # Field name made lowercase. The composite primary key (asi_Codigo, gru_Numero, est_ID) found, that is not supported. The first column is selected.
    gru_numero = models.ForeignKey(Grupo, models.DO_NOTHING, db_column='gru_Numero', to_field='gru_Numero', related_name='grupoestudiante_gru_numero_set')  # Field name made lowercase.
    est = models.ForeignKey(Estudiante, models.DO_NOTHING, db_column='est_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'grupoestudiante'
        unique_together = (('asi_codigo', 'gru_numero', 'est'),)


class Profesor(models.Model):
    pro_id = models.AutoField(db_column='pro_ID', primary_key=True)  # Field name made lowercase.
    pro_nombres = models.CharField(db_column='pro_Nombres', max_length=45)  # Field name made lowercase.
    pro_apellidos = models.CharField(db_column='pro_Apellidos', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'profesor'


class Sede(models.Model):
    sed_codigo = models.IntegerField(db_column='sed_Codigo', primary_key=True)  # Field name made lowercase.
    sed_nombre = models.CharField(db_column='sed_Nombre', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'sede'
