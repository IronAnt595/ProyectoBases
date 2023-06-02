from django.urls import path
from . import views

app_name = 'evaluacion'
urlpatterns = [
    path('login/', views.loginn, name='login'),
    path('logout/', views.logoutt, name='logout'),
    path('registro/', views.registro, name='registro'),
    path('bienvenida/', views.bienvenida, name='bienvenida'),
    path('inicio/', views.inicio, name='inicio'),
    path('info_encuesta/', views.info_encuesta, name='info_encuesta'),
    path('encuesta/', views.encuesta, name='encuesta'),
    path('info_estudiante/', views.info_estudiante, name='info_estudiante'),
    path('info_asignaturas/', views.info_asignaturas, name='info_asignaturas'),
    path('procesar_pregunta/', views.procesar_pregunta, name='procesar_pregunta'),
]