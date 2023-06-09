# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Asignatura(models.Model):
    asi_codigo = models.IntegerField(db_column='asi_Codigo', primary_key=True)  # Field name made lowercase.
    asi_nombre = models.CharField(db_column='asi_Nombre', max_length=45)  # Field name made lowercase.
    asi_creditos = models.IntegerField(db_column='asi_Creditos')  # Field name made lowercase.
    asi_tipo = models.CharField(db_column='asi_Tipo', max_length=45)  # Field name made lowercase.
    fac_codigo = models.ForeignKey('Facultad', models.DO_NOTHING, db_column='fac_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'asignatura'


class Carrera(models.Model):
    car_codigo = models.IntegerField(db_column='car_Codigo', primary_key=True)  # Field name made lowercase.
    car_nombre = models.CharField(db_column='car_Nombre', max_length=45)  # Field name made lowercase.
    fac_codigo = models.ForeignKey('Facultad', models.DO_NOTHING, db_column='fac_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'carrera'


class Estudiante(models.Model):
    est = models.OneToOneField('Persona', models.DO_NOTHING, db_column='est_ID', primary_key=True)  # Field name made lowercase.
    est_papa = models.FloatField(db_column='est_PAPA')  # Field name made lowercase.
    est_pappi = models.FloatField(db_column='est_PAPPI')  # Field name made lowercase.
    est_pa = models.FloatField(db_column='est_PA')  # Field name made lowercase.
    est_evaluacion = models.IntegerField(db_column='est_Evaluacion')  # Field name made lowercase.
    est_grado = models.CharField(db_column='est_Grado', max_length=45)  # Field name made lowercase.
    car_codigo = models.ForeignKey(Carrera, models.DO_NOTHING, db_column='car_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'estudiante'


class EvaluacionAbierta(models.Model):
    pre_numero = models.OneToOneField('Pregunta', models.DO_NOTHING, db_column='pre_Numero', primary_key=True)  # Field name made lowercase. The composite primary key (pre_Numero, est_ID, gru_Codigo) found, that is not supported. The first column is selected.
    est = models.ForeignKey('GrupoEstudiante', models.DO_NOTHING, db_column='est_ID')  # Field name made lowercase.
    gru_codigo = models.ForeignKey('GrupoEstudiante', models.DO_NOTHING, db_column='gru_Codigo', to_field='gru_Codigo', related_name='evaluacionabierta_gru_codigo_set')  # Field name made lowercase.
    eva_calificacion = models.TextField(db_column='eva_Calificacion')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'evaluacion_abierta'
        unique_together = (('pre_numero', 'est', 'gru_codigo'),)


class EvaluacionNumerica(models.Model):
    pre_numero = models.OneToOneField('Pregunta', models.DO_NOTHING, db_column='pre_Numero', primary_key=True)  # Field name made lowercase. The composite primary key (pre_Numero, est_ID, gru_Codigo) found, that is not supported. The first column is selected.
    est = models.ForeignKey('GrupoEstudiante', models.DO_NOTHING, db_column='est_ID')  # Field name made lowercase.
    gru_codigo = models.ForeignKey('GrupoEstudiante', models.DO_NOTHING, db_column='gru_Codigo', to_field='gru_Codigo', related_name='evaluacionnumerica_gru_codigo_set')  # Field name made lowercase.
    eva_calificacion = models.IntegerField(db_column='eva_Calificacion')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'evaluacion_numerica'
        unique_together = (('pre_numero', 'est', 'gru_codigo'),)


class Facultad(models.Model):
    fac_codigo = models.IntegerField(db_column='fac_Codigo', primary_key=True)  # Field name made lowercase.
    fac_nombre = models.CharField(db_column='fac_Nombre', max_length=45)  # Field name made lowercase.
    sed_codigo = models.ForeignKey('Sede', models.DO_NOTHING, db_column='sed_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'facultad'


class Grupo(models.Model):
    gru_codigo = models.AutoField(db_column='gru_Codigo', primary_key=True)  # Field name made lowercase.
    asi_codigo = models.ForeignKey(Asignatura, models.DO_NOTHING, db_column='asi_Codigo')  # Field name made lowercase.
    gru_numero = models.IntegerField(db_column='gru_Numero')  # Field name made lowercase.
    gru_anno = models.IntegerField(db_column='gru_Anno')  # Field name made lowercase.
    gru_semestre = models.IntegerField(db_column='gru_Semestre')  # Field name made lowercase.
    pro = models.ForeignKey('Profesor', models.DO_NOTHING, db_column='pro_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'grupo'
        unique_together = (('asi_codigo', 'gru_numero'),)


class GrupoEstudiante(models.Model):
    est = models.OneToOneField(Estudiante, models.DO_NOTHING, db_column='est_ID', primary_key=True)  # Field name made lowercase. The composite primary key (est_ID, gru_Codigo) found, that is not supported. The first column is selected.
    gru_codigo = models.ForeignKey(Grupo, models.DO_NOTHING, db_column='gru_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'grupo_estudiante'
        unique_together = (('est', 'gru_codigo'),)


class Persona(models.Model):
    per_id = models.AutoField(db_column='per_ID', primary_key=True)  # Field name made lowercase.
    per_usuario = models.CharField(db_column='per_Usuario', unique=True, max_length=45)  # Field name made lowercase.
    per_nombres = models.CharField(db_column='per_Nombres', max_length=45)  # Field name made lowercase.
    per_apellidos = models.CharField(db_column='per_Apellidos', max_length=45)  # Field name made lowercase.
    per_rol = models.CharField(db_column='per_Rol', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'persona'


class Pregunta(models.Model):
    pre_numero = models.AutoField(db_column='pre_Numero', primary_key=True)  # Field name made lowercase.
    pre_descripcion = models.CharField(db_column='pre_Descripcion', max_length=100)  # Field name made lowercase.
    pre_tipo = models.CharField(db_column='pre_Tipo', max_length=45)  # Field name made lowercase.
    pre_evaluado = models.CharField(db_column='pre_Evaluado', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pregunta'


class Profesor(models.Model):
    pro = models.OneToOneField(Persona, models.DO_NOTHING, db_column='pro_ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'profesor'


class Sede(models.Model):
    sed_codigo = models.IntegerField(db_column='sed_Codigo', primary_key=True)  # Field name made lowercase.
    sed_nombre = models.CharField(db_column='sed_Nombre', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'sede'