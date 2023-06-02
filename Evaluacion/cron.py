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