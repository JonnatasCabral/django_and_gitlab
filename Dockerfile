FROM python:3.6


RUN mkdir current/

COPY . current/ 

COPY requirements.txt current/

WORKDIR current/

RUN pip install -r requirements.txt
RUN python manage.py migrate --noinput

CMD python manage.py runserver 0.0.0.0:8080 
