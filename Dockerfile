FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service

EXPOSE 8000
EXPOSE 80
EXPOSE 5432

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN pip install --upgrade pip

RUN adduser --disabled-password service-user

USER service-user


#COPY requirements.txt /temp/requirements.txt



#RUN mkdir /service/static
#RUN mkdir /service/media



#COPY . .





