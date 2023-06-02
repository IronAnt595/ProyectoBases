from django.contrib.auth.models import User, Group
from django.db import connection
from unidecode import unidecode

def verificar_existencia_usuario(username):
    try:
        user = User.objects.get(username=username)
        # El usuario existe
        return True
    except User.DoesNotExist:
        # El usuario no existe
        return False

def crear_usuarios():

    with connection.cursor() as cursor:
        cursor.execute("select * from persona")
        personas = cursor.fetchall()
        usuarios_creados = []
        for row in personas:
            username = unidecode(row[1])
            if not verificar_existencia_usuario(username):
                usuarios_creados.append(username)
                password = unidecode(row[1])
                print(password)
                rol = row[4]
                user = User.objects.create_user(username=username, password=password)
                group = Group.objects.get(name=rol)
                user.groups.add(group)
                user.save()
        return usuarios_creados

def informacionEstudiante(username):
    with connection.cursor() as cursor:
        datos = {}
        cursor.execute("call sp_infoest(%s)",[username])
        resultado = cursor.fetchone()
        datos['usuario'] = username
        datos['nombres'] = resultado[0]
        datos['apellidos'] = resultado[1]
        datos['sede'] = resultado[8]
        datos['facultad'] =resultado[7]
        datos['grado'] = resultado[5]
        datos['carrera'] = resultado[6]
        datos['PAPA'] = resultado[2]
        datos['PAPPI'] = resultado[3]
        datos['PA'] = resultado[4]
        return datos
    
def informacionAsignaturas(username):
    with connection.cursor() as cursor:
        datos = []
        cursor.execute("call sp_gruposest(%s)",[username])
        resultados = cursor.fetchall()
        for resultado in resultados:
            asignatura = {}
            asignatura['codigogrupo'] = resultado[0]
            asignatura['nombre'] = resultado[1]
            asignatura['creditos'] = resultado[2]
            asignatura['profesor'] = resultado[3]+" "+resultado[4]
            datos.append(asignatura)
        return datos