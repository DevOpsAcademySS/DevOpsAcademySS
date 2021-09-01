# syntax=docker/dockerfile:1

FROM centos7:hw
FROM python:3.8-slim-buster

EXPOSE 5000

WORKDIR /app

COPY app/requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
COPY app/. /app

CMD [ "python3", "./app.py" ]