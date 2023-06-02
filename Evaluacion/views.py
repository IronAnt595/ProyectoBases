from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from .procesos import proceso
from .cron import crear_usuarios

# Create your views here.
    
def index(request):
    # print(request.user.id)
    # hola = proceso(request.user.id)
    # return render(request, 'Evaluacion/index.html', context={'informacion': hola})
    if not request.user.is_authenticated:
        return HttpResponse("No estas logueado")
    else:
        return render(request, 'Evaluacion/index.html')
    
def registro(request):
    usuarios=crear_usuarios()
    if len(usuarios) == 0:
        return HttpResponse("Usuarios no creados")
    else:
        return HttpResponse(str(len(usuarios))+" usuarios creados"+usuarios.__str__())

def loginn(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        Usuario = authenticate(request, username=username, password=password)
        if Usuario is not None:
            login(request, Usuario)
            return redirect('evaluacion:index')
        
        else:
            return render(request, 'Evaluacion/login.html', context={'error_message': 'Usuario o contraseña incorrectos'})
    else:
        return render(request, 'Evaluacion/login.html')
    
def logoutt(request):
    logout(request)
    return redirect('evaluacion:login')

