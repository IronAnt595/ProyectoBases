from django.contrib.auth import get_user_model
from django.contrib.auth.backends import ModelBackend


class EmailBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, group=None, **kwargs):
        # UserModel = get_user_model()
        # try:
        #     user = UserModel.objects.get(username=username)
        # except UserModel.DoesNotExist:
        #     return None
        # else:
        #     if user.check_password(password):
        #         return user
        # return None
        UserModel = get_user_model()
        try:
            user = UserModel.objects.get(username=username)
        except UserModel.DoesNotExist:
            return None
        else:
            if user.check_password(password):
                if group == "Estudiante" and user.groups.filter(name='Estudiante').exists():
                    return user
                elif group == "Profesor" and user.groups.filter(name='Profesor').exists():
                    return user
                elif group == "Administrativo" and user.groups.filter(name='Administrativo').exists():
                    return user
        return None