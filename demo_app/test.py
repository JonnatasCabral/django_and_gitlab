from django.test import TestCase
from django.test import Client
from django.contrib.auth.models import User


class AnimalTestCase(TestCase):

    def setUp(self):
        user = User.objects.create_user(
            'admin', password='secrettest')
        user.is_superuser = True
        user.is_staff = True
        user.save()

    def test_access_admin(self):
        """
            Se o usuario for autenticado, redireciona para pagina de profile.
            Esperando status_code = 302
        """
        client = Client()
        response = client.post(
            '/admin/login/',
            {'username': 'admin', 'password': 'secrettest'})
        self.assertEqual(response.status_code, 302)
