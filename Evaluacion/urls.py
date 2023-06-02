from django.urls import path
from . import views

app_name = 'evaluacion'
urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.loginn, name='login'),
    path('logout/', views.logoutt, name='logout'),
    path('registro/', views.registro, name='registro'),
    path('bienvenida/', views.bienvenida, name='bienvenida'),
    path('inicio/', views.inicio, name='inicio'),
    path('info_encuesta/', views.info_encuesta, name='info_encuesta'),
]