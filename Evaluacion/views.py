from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the Evaluacion index.")

def login(request):
    return render(request, 'Evaluacion/login.html', context=None)
