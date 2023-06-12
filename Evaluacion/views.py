from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .cron import *
from pprint import pprint

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
    return render(request, 'Evaluacion/error_login.html')

@login_required()
def info_estudiante(request):
    if request.user.groups.filter(name='Estudiante').exists():
        datos=informacionEstudiante(request.user.username)
        datos={'datos':datos}
        return render(request, 'Evaluacion/info_estudiante.html', context=datos)
    else:
        return render(request, 'Evaluacion/error_login.html')
    
@login_required()
def info_asignaturas(request):
    if request.user.groups.filter(name='Estudiante').exists():
        asignaturas=informacionAsignaturas(request.user.username)
        context={'asignaturas':asignaturas}
        return render(request, 'Evaluacion/info_asignaturas.html', context=context)
    else:
        return render(request, 'Evaluacion/error_login.html')
    
@login_required()
def info_encuesta(request):
    request.session['indice']=0
    request.session['respuestas']=dict()
    if request.user.groups.filter(name='Estudiante').exists():
        return render(request, 'Evaluacion/info_encuesta.html')
    else:
        return render(request, 'Evaluacion/error_login.html')
    
@login_required()
def encuesta(request):

    if not encuestaRealizada(request.user.username):

        #Obtener la pregunta actual
        indice = request.session['indice']
        preguntas = obtenerPreguntas()
        longitud = len(preguntas)
        pregunta_actual = preguntas[indice]
        context = {'descripcion': pregunta_actual[1],
                'tipo': pregunta_actual[2],
                'evaluado': pregunta_actual[3],
                'numpregunta': indice+1,
                'rango': range(1,6),
                'respuestas': request.session['respuestas'].get(str(pregunta_actual[0])),
                'longitud': longitud,
                }
        #Obtener los grupos
        asignaturas = informacionAsignaturas(request.user.username)
        context['asignaturas'] = asignaturas

        if request.user.groups.filter(name='Estudiante').exists():
            return render(request, 'Evaluacion/encuesta.html', context=context)
        else:
            return render(request, 'Evaluacion/error_login.html')
    else:
        return render(request, 'Evaluacion/finalizar_encuesta.html')
    
    
@login_required()
def procesar_pregunta(request):
    #Hacer que se pueda devolver sin llenar toda la pregunta **********************Falta***************
    if not encuestaRealizada(request.user.username):
        if request.method == 'POST':
        # Si es numérica o abierta
            asignaturas = informacionAsignaturas(request.user.username)
            codgrupo = [str(grupo['codigogrupo']) for grupo in asignaturas]
            #Obtener el código de la pregunta
            preguntas = obtenerPreguntas()
            pregunta_actual = preguntas[request.session['indice']]
            metodo = pregunta_actual[2]
            codpregunta = pregunta_actual[0]
            respuestas = request.session['respuestas']
            respuestas[codpregunta] = dict()
            if metodo == 'Numérica':
                try:
                    for i in codgrupo:
                        respuestas[codpregunta][i] = int(request.POST.get(f'respuesta_{i}'))

                #Guardarlas en request.session['respuestas']
                    request.session['respuestas'] = respuestas
                except TypeError:
                    return redirect('evaluacion:encuesta')
            elif metodo == 'Abierta':
                for i in codgrupo:
                    respuesta = request.POST.get(f'respuesta_{i}')
                    if respuesta:
                        respuestas[codpregunta][i] = respuesta
                    else:
                        return redirect('evaluacion:encuesta')
                request.session['respuestas'] = respuestas
            
        #Actualizar el índice
        if request.POST.get('accion')=='Siguiente':
            request.session['indice'] += 1
            
        elif request.POST.get('accion')=='Anterior':
            request.session['indice'] -= 1

        elif request.POST.get('accion')=='Finalizar':
            return redirect('evaluacion:finalizar_encuesta')
            
        return redirect('evaluacion:encuesta')
    else:
        return render(request, 'Evaluacion/finalizar_encuesta.html')

@login_required()
def finalizar_encuesta(request):
    # Enviar datos a la base de datos
    if request.user.groups.filter(name='Estudiante').exists():
        if not encuestaRealizada(request.user.username): #Si no ha realizado la encuesta
            preguntas=obtenerPreguntas()
            respuestas = request.session['respuestas']
            #Enviar a función que guarde en la base de datos
            enviarRespuestas(request.user.username, respuestas, preguntas)
        return render(request, 'Evaluacion/finalizar_encuesta.html')
    else:
        return render(request, 'Evaluacion/error_login.html')
    
#Vistas para el profesor
# preguntas evaluativas
@login_required()
def preguntas_evaluativas(request):
    if request.user.groups.filter(name='Profesor').exists():
        preguntas = obtenerPreguntas()
        asignatura = [pregunta[1] for pregunta in preguntas if pregunta[3] == 'Asignatura']
        profesor = [pregunta[1] for pregunta in preguntas if pregunta[3] == 'Profesor']
        context = {'asignatura': asignatura, 'profesor': profesor}
        return render(request, 'Evaluacion/preguntas_evaluativas.html', context=context)
    else:
        return render(request, 'Evaluacion/error_login.html')

# documentación
@login_required()
def documentacion(request):
    if request.user.groups.filter(name='Profesor').exists():
        return render(request, 'Evaluacion/documentacion.html')
    else:
        return render(request, 'Evaluacion/error_login.html')
# consultar mis resultados
#resultados numéricos
@login_required()
def resultados_numericos(request):
    #Obtener los resultados numéricos de la base de datos
    if request.user.groups.filter(name='Profesor').exists() or request.user.groups.filter(name='Administrativo').exists():
        #Obtener las preguntas
        preguntass = obtenerPreguntas()
        preguntas = dict()
        for pregunta in preguntass:
            if pregunta[2] == 'Numérica': #Obtener las preguntas numéricas
                numpregunta = pregunta[0]
                preguntas[numpregunta] = {'descripcion': pregunta[1],
                                        }
                #Obtener los grupos del profesor
                if request.user.groups.filter(name='Profesor').exists():
                    grupos = obtenerGruposProfesor(request.user.username) 
                    for grupo in grupos:
                        codgrupo = grupo[0]
                        asignatura = grupo[1]
                        hola = obtenerResultadosNumericos(request.user.username, numpregunta, codgrupo) #Llamar a un procedimiento almacenado
                        grafico=pie_chart(hola)
                        preguntas[numpregunta][codgrupo] = {'asignatura': asignatura,
                                                        'resultados': hola,
                                                        'grafico': grafico,} 
                elif request.user.groups.filter(name='Administrativo').exists(): 
                    grupos = obtenerGruposProfesor(request.session['docente']) 
                    for grupo in grupos:
                        codgrupo = grupo[0]
                        asignatura = grupo[1]
                        hola = obtenerResultadosNumericos(request.session['docente'], numpregunta, codgrupo) #Llamar a un procedimiento almacenado
                        grafico=pie_chart(hola)
                        preguntas[numpregunta][codgrupo] = {'asignatura': asignatura,
                                                        'resultados': hola,
                                                        'grafico': grafico,}  
        #Enviar a la vista
        context = {'preguntas': preguntas}
        return render(request, 'Evaluacion/resultados_numericos.html', context)
    else:
        return render(request, 'Evaluacion/error_login.html')
    
#resultados abiertos
@login_required()
def resultados_abiertos(request):
    #Obtener los resultados abiertos de la base de datos
    if request.user.groups.filter(name='Profesor').exists() or request.user.groups.filter(name='Administrativo').exists():
        #obtener las preguntas
        preguntass = obtenerPreguntas() 
        preguntas = dict()
        for pregunta in preguntass:
            if pregunta[2] == "Abierta": #Obtener las preguntas abiertas
                numpregunta = pregunta[0]
                preguntas[numpregunta] = {'descripcion': pregunta[1],
                                        }
                #Obtener los grupos del profesor
                if request.user.groups.filter(name='Profesor').exists():
                    grupos = obtenerGruposProfesor(request.user.username) 
                    for grupo in grupos:
                        codgrupo = grupo[0]
                        asignatura = grupo[1]
                        hola = obtenerResultadosAbiertos(request.user.username, numpregunta, codgrupo)
                        preguntas[numpregunta][codgrupo] = {'asignatura': asignatura,
                                                            'resultados': hola,}
                elif request.user.groups.filter(name='Administrativo').exists():
                    grupos = obtenerGruposProfesor(request.session['docente']) 
                    for grupo in grupos:
                        codgrupo = grupo[0]
                        asignatura = grupo[1]
                        hola = obtenerResultadosAbiertos(request.session['docente'], numpregunta, codgrupo)
                        preguntas[numpregunta][codgrupo] = {'asignatura': asignatura,
                                                            'resultados': hola,}
        #Enviar a la vista
        context = {'preguntas': preguntas}

        pprint(context)
        return render(request, 'Evaluacion/resultados_abiertos.html', context)
    else:
        return render(request, 'Evaluacion/error_login.html')
    
#Vistas de directivo

# Resultados por docente

@login_required()
def eleccion_docente(request):
    if request.user.groups.filter(name='Administrativo').exists():
        if request.method == 'POST':
            docente = request.POST.get('docente')
            nombre, apellido = docente.split(' ')
            id=obtenerProfesores(nombre, apellido)
            if id:
                request.session['docente'] = id
                return redirect('evaluacion:resultados_numericos')
            else:
                context={'error': 'No se encontró el docente'}
                return render(request, 'Evaluacion/eleccion_docente.html', context)
        return render(request, 'Evaluacion/eleccion_docente.html')
    else:
        return render(request, 'Evaluacion/error_login.html')

# # Modficación de preguntas
# # Mostrar Preguntas
# @login_required()
# def mostrar_preguntas(request):
#     if request.user.groups.filter(name='Administrativo').exists():
#         preguntass = obtenerPreguntas()
#         preguntas = {'abiertas':{},
#                     'numericas':{},}
#         for pregunta in preguntass:
#             if pregunta[2]=="Abierta":
#                 numpregunta = pregunta[0]
#                 preguntas['abiertas'][numpregunta] = {'descripcion': pregunta[1]}
#             elif pregunta[2] == "Numérica":
#                 numpregunta = pregunta[0]
#                 preguntas['numericas'][numpregunta] = {'descripcion': pregunta[1]}
#         pprint(preguntas)
#         if request.method=="POST":
#             pprint(request.POST)
#             if request.POST.get('accion')=='Modificar':
#                 return redirect('evaluacion:modificar_pregunta')
            
#         return render(request, 'Evaluacion/mostrar_preguntas.html', preguntas)
#     else:
#         return render(request, 'Evaluacion/error_login.html')

