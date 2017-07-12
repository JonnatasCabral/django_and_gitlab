
INPUT=$(filter-out $@,$(MAKECMDGOALS))
MANAGE_PY=python manage.py

PROJECT_NAME='django_and_gitlab'

dev: $(eval SETTINGS:=$(SETTINGS_DEV))

prod: $(eval SETTINGS:=$(SETTINGS_PROD))

requirements: 
	@pip install -r requirements.txt

build:
	@docker build  -t  demo_app_gitlab . 

runserver:
	@docker run -it  -p 8080:8080 demo_app_gitlab 
test:
	@docker run -it demo_app_gitlab $(MANAGE_PY) test
