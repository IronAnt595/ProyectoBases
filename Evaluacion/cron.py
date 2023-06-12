from django.contrib.auth.models import User, Group
from django.db import connection
from unidecode import unidecode
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from io import BytesIO
import base64

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
        if resultado:
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
        return None
    
def informacionAsignaturas(username):
    with connection.cursor() as cursor:
        datos = []
        cursor.execute("call sp_gruposest(%s)",[username])
        resultados = cursor.fetchall()
        for resultado in resultados:
            asignatura = {}
            asignatura['codigogrupo'] = str(resultado[0])
            asignatura['nombre'] = resultado[1]
            asignatura['creditos'] = resultado[2]
            asignatura['profesor'] = resultado[3]+" "+resultado[4]
            datos.append(asignatura)
        return datos
    
def obtenerPreguntas():
    with connection.cursor() as cursor:
        cursor.execute("select * from pregunta")
        preguntas = cursor.fetchall()
        return preguntas
    
def enviarRespuestas(username, respuestas, preguntas):
    for numpregunta, respuesta in respuestas.items():
        tipo = preguntas[int(numpregunta)-1][2]
        for grupo, valor in respuesta.items():
            if tipo == 'Numérica':
                with connection.cursor() as cursor:
                    cursor.execute("call sp_evalnum(%s,%s,%s,%s)",[numpregunta,username,grupo,valor])# Llamar al procedimiento almacenado numérico
            elif tipo == 'Abierta':
                with connection.cursor() as cursor:
                    cursor.execute("call sp_evalabi(%s,%s,%s,%s)",[numpregunta,username,grupo,valor])# Llamar al procedimiento almacenado abierto

def encuestaRealizada(username):
    with connection.cursor() as cursor:
        cursor.execute("call sp_encuestarealizada(%s)",[username])
        resultado = cursor.fetchone()
        if resultado[0] == 1:
            return True
        else:
            return False
        
def obtenerResultadosNumericos(username, numpregunta,codgrupo):
    with connection.cursor() as cursor:
        numericos = {}
        cursor.execute("call sp_calinumerica(%s,%s,%s)",[numpregunta,username,codgrupo])
        resultados = cursor.fetchall()
        for resultado in resultados:
            numericos[resultado[0]] = resultado[1]
        return numericos
    
#Obtener los resultados abiertos
def obtenerResultadosAbiertos(username, numpregunta,codgrupo):
    with connection.cursor() as cursor:
        abiertos = []
        cursor.execute("call sp_caliabierta(%s,%s,%s)",[numpregunta,username,codgrupo])
        resultados = cursor.fetchall()
        for resultado in resultados:
            abiertos.append(resultado[0])
        return abiertos
    
#Obtener los grupos de cada profesor
def obtenerGruposProfesor(username):
    with connection.cursor() as cursor:
        cursor.execute("call sp_gruposprof(%s)",[username])
        resultados = cursor.fetchall()
        return resultados

def pie_chart(datos):
    if datos:
        
        colores = {1:"#61CE5B",
                   2:"#3857BC",
                   3:"#AE7DF0",
                   4:"#FF8B47",
                   5:"#F3DA49"}
        # Crear gráfico
        labels = list(datos.keys())
        values = list(datos.values())
        colors = [colores.get(i) for i in labels]

        fig, ax = plt.subplots()
        ax.pie(values, labels=labels, autopct='%1.1f%%', startangle=90, colors=colors)
        ax.axis('equal')

        # Convertir el gráfico en una representación base64
        buffer = BytesIO()
        plt.savefig(buffer, format='png')
        buffer.seek(0)
        imagen_base64 = base64.b64encode(buffer.read()).decode('utf-8')
        buffer.close()

        return imagen_base64
        
#Obtener si un profesor existe
def obtenerProfesores(nombre, apellido):
    with connection.cursor() as cursor:
        cursor.execute("call sp_obtenerprof(%s,%s)",[nombre,apellido])
        resultados = cursor.fetchone()
        print(resultados)
        if resultados:
            return resultados[2] #Si existe el profesor, se devuelve su usuario
        else:
            return None