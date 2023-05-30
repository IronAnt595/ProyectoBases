from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.db import connection
# Create your views here.

def proceso(id):
    with connection.cursor() as cursor:
        cursor.execute("select * from estudiante where est_id=(%s)",[id])
        resultado = cursor.fetchone()
        return resultado
    
def index(request):
    print(request.user.id)
    hola = proceso(request.user.id)
    return HttpResponse(hola)

def loginn(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        Usuario = authenticate(request, username=username, password=password)
        print(Usuario)
        if Usuario is not None:
            login(request, Usuario)
            return redirect('evaluacion:index')
        
        else:
            return HttpResponse("Usuario no valido")
    else:
        return render(request, 'Evaluacion/login.html')

