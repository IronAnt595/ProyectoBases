from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .cron import crear_usuarios

# Create your views here.
    
# Vistas de prueba:   
def registro(request):
    usuarios=crear_usuarios()
    if len(usuarios) == 0:
        return HttpResponse("Usuarios no creados")
    else:
        return HttpResponse(str(len(usuarios))+" usuarios creados"+usuarios.__str__())


# Vistas definitivas:

def bienvenida(request):
    if request.method == 'POST':
        rol = request.POST.get('rol')
        request.session['rol'] = rol
        return redirect('evaluacion:login')
    return render(request, 'Evaluacion/bienvenida.html')

def loginn(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        Usuario = authenticate(request, username=username, password=password, group=request.session['rol'])
        if Usuario is not None:
            login(request, Usuario)
            return redirect('evaluacion:inicio')
        
        else:
            return render(request, 'Evaluacion/login.html', context={'error_message': 'Usuario o contraseña incorrectos'})
    else:
        context = {"rol": request.session['rol']}
        return render(request, 'Evaluacion/login.html', context=context)
    
    
def logoutt(request):
    logout(request)
    return redirect('evaluacion:bienvenida')

@login_required()
def inicio(request):
    if request.user.groups.filter(name='Estudiante').exists():
        return render(request, 'Evaluacion/inicio_estudiante.html')
    elif request.user.groups.filter(name='Profesor').exists():
        return render(request, 'Evaluacion/inicio_profesor.html')
    elif request.user.groups.filter(name='Administrativo').exists():
        return render(request, 'Evaluacion/inicio_administrativo.html')
    return HttpResponse("No tienes permisos para ver esta pagina")
    
@login_required()
def info_encuesta(request):
    if request.user.groups.filter(name='Estudiante').exists():
        return render(request, 'Evaluacion/info_encuesta.html')
    else:
        return HttpResponse("No tienes permisos para ver esta pagina")