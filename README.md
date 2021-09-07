# Python-Scripts
## hw1.py Operating System interfaces
Program that generate folders

How to run:
```
python hw1.py /home usr 20 551
```
It creates 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551
## hw2.py Text
Program that parses a JSON file

How to run:
```
python hw2.py /home/usr/data_json /home/usr/result.json
```
It reads all files on the path /home/usr/data_json and writes on the file /home/usr/result.json the necessary information like this:
{"id": 22, "number": "34", "committer_name": "Some Commiter", "committer_email": "some.commiter@gmail.com"}
## hw3.py Networking
Program that generate folders on a remote computer

How to run:
```
python hw3.py 192.168.0.2 22 someuser /home usr 20 551 patch
```
It runs ssh-connect to a remote host 192.168.0.2 using credentinal of 'someuser' and creates there 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551
## hw4.py Packaging
Program that outputs header field rpm.RPMTAG_RELEASE of this file

How to run:
```
python hw4.py /home/usr/some_file.rpm
```
It reads header of the file /home/usr/some_file.rpm and print field like this: 5.rel8.centos
## hw5.py Databases
Program that sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'

How to run:
```
python hw5.py /home/usr/example.db
```

## hw6.py Docker
Program that creates a Docker image and contains a apache is that displays in a browser "Homework6!”

How to run:
```
python hw6.py homework:6
```