FROM python:3.8.10-slim-buster
MAINTAINER emma415g@gmail.com

RUN apt update -y
RUN update-alternatives --install /usr/local/bin/python python /usr/local/bin/python3 20

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt 

ENV DJANGO_SETTINGS_MODULE=config.settings.prod

WORKDIR /usr/src/django

CMD ["gunicorn", "config.wsgi:application", "--bind 0.0.0.0:52222"]
