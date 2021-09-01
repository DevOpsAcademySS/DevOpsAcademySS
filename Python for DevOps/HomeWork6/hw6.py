from sys import argv, path
import os
import docker

# Task: Write program that creates a Docker image that based on image 'centos7/hw’ (which need to import) and contains a simple Web applications is that displays in a browser "Homework6!”.

# Input parameters: tag_name

# Example: python hw6.py homework:6

# Result of example run: it creates new Docker image with name 'homework:6' and based on image 'centos7/hw'. The command:

# 'docker run homework:6' starts the container. The connection to the address of one through the browser returns in browser string "Homework6!".

# -----------------------------------------------------------------------------------------

# COMMAND TO IMPORT IMAGE TO DOCKER: "tar -c centos7_hw.tar | docker import - centos7:hw"
# COMMAND TO BUILD IMAGE:            "docker build -t homework:6 ."
# COMMAND TO RUN IMAGE IN CONTAINER: "docker run -p 8080:5000 --name homework homework:6"


def create_dockerfile():
    print('Writing Dockerfile...')
    with open('Dockerfile', 'w') as dockerfile:
        file = '''# syntax=docker/dockerfile:1

        FROM centos7:hw
        FROM python:3.8-slim-buster

        EXPOSE 5000

        WORKDIR /app

        COPY app/requirements.txt /app/requirements.txt
        RUN pip3 install -r requirements.txt
        COPY app/. /app

        CMD [ "python3", "./app.py" ]'''
        dockerfile.write(file)
    print('Writing Done.')


def build_image(dockerfile_path, tag_name):
    with open('Dockerfile', 'r') as dockerfile:
        print('Building image...')
        client = docker.from_env()
        client.images.build(path=dockerfile_path, tag=tag_name)
        print('Building Done.')

        print('Images: ', client.images.list(all=True))


tag_name = argv[1]
dockerfile_path = os.path.abspath(' ')

create_dockerfile()
build_image(dockerfile_path, tag_name)
