from django.test import TestCase
from django.test import Client


class AnimalTestCase(TestCase):

    def test_acess_page(self):
        client = Client()
        response = client.post('/admin/login/', {'username': 'john', 'password': 'smith'})
        self.assertEqual(response.status_code, 200)
