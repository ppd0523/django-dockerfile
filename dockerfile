FROM python:3.8.10-slim-buster
MAINTAINER emma415g@gmail.com

RUN apt update -qq -y && apt upgrade -qq -y
RUN update-alternatives --install /usr/local/bin/python python /usr/local/bin/python3 20

RUN pip install \
django==3.2.3 \
djangorestframework==3.12.4 \
psycopg2-binary==2.8.6 \
django-cors-headers==3.7.0 \
gunicorn==20.1.0 \
django-debug-toolbar==3.2.1

ENV DJANGO_SETTINGS_MODULE=config.settings.prod

WORKDIR /usr/src/django

CMD ["gunicorn", "config.wsgi:application", "--bind 0.0.0.0:52222"]