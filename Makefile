
INPUT=$(filter-out $@,$(MAKECMDGOALS))
MANAGE_PY=$(VIRTUAL_ENV)/bin/python manage.py

PROJECT_NAME='django_and_gitlab'

dev: $(eval SETTINGS:=$(SETTINGS_DEV))

prod: $(eval SETTINGS:=$(SETTINGS_PROD))

requirements: 
	@pip install -r requirements.txt

superuser: 
	@$(MANAGE_PY) createsuperuser z


runserver:
	@$(MANAGE_PY) runserver 

mig:
	@$(MANAGE_PY) migrate 

makemig:
	@$(MANAGE_PY) makemigrations z

test:
	@$(MANAGE_PY) test
