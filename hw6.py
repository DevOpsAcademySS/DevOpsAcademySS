import os, sys

name = sys.argv[1]
os.system("sudo docker build -t " + name + " .")
os.system("docker run -d -p 8090:80 " + name)
