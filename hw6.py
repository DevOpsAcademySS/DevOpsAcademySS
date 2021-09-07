
import sys, os
import docker
os.system("sudo docker import centos7_hw.tar centos7:hw")
print("Image imported\n")
with open('Dockerfile', 'w') as dockerfile:
    file = '''# syntax=docker/dockerfile:1
    FROM centos7:hw
    FROM python:3.8-slim-buster
    WORKDIR /app
    RUN pip install flask
    COPY . /app
    ENTRYPOINT [ "python" ]
    CMD [ "app.py" ]'''
    dockerfile.write(file)

client = docker.from_env()
client.images.build(path=".", dockerfile='Dockerfile', tag=sys.argv[1])
print("Image built\n")
os.system("sudo docker run {image}".format(image=sys.argv[1]))
client.close()