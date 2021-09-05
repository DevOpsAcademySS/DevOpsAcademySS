### KOZAK MYKOLA
### **Python for DevOps**
_____________________________________
### **Module 1. Operating System interfaces**
**Task:** Create a program that generate folders.

**Program name:** [hw1.py](module1/hw1.py)

**Input parameters:** path, prefix, counts, mode

**Example:** `python hw1.py /home usr 20 551`

**Result of example run:** It creates 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551
___
### **Module 2. Text**
**Task:** There are a set of JSON-files that contains answers from the CI server. An example of such is attached hw2_example.json. Create a program that returns JSON-file which contains 'id', 'number', 'committer_name' and 'committer_email' from last of failed builds (in other words - with the highest value of 'number' and non-zero 'result').

**Program name:** [hw2.py](module2/hw2.py)

**Example:** `python hw2.py /home/usr/data_json /home/usr/result.json`

**Result of example run:** it reads all files on the path /home/usr/data_json and writes on the file /home/usr/result.json the necessary information like this:
```
{"id": 22, "number": "34", "committer_name": "Some Commiter", "committer_email": "some.commiter@gmail.com"}
```
___
### **Module 3. Networking**
**Task:** Create a program that generate folders on a remote computer through a SSH connection.

**Program name:** [hw3.py](module3/hw3.py)

**Example:** `python hw3.py 192.168.0.2 22 someuser /home usr 20 551`

**Result of example run:** it runs ssh-connect to a remote host 192.168.0.2 using credentinal of 'someuser' and creates there 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551
___
### **Module 4. Packaging**
**Task:** There is some rpm-file. Create program that outputs header field rpm.RPMTAG_RELEASE of this file.

**Program name:** [hw4.py](module4/hw4.py)

**Example:** `python hw4.py /home/usr/some_file.rpm`

**Result of example run:** it reads header of the file /home/usr/some_file.rpm and print field like this: 5.rel8.centos
___
### **Module 5. Databases**
**Task:** There is some SQLite database example.db. Create program that sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'.

**Program name:** [hw5.py](module5/hw5.py)

**Example:** `python hw5.py /home/usr/example.db`
___
### **Module 6. Docker**
**Task:** Write program that creates a Docker image that based on image 'centos7/hw’ (which need to import) and contains a simple Web applications is that displays in a browser "Homework6!”.

**Program name:** [hw6.py](module6/hw6.py)

**Example:** `python hw6.py homework:6`

**Result of example run:** it creates new Docker image with name 'homework:6' and based on image 'centos7/hw'. The command:
`docker run homework:6` starts the container. The connection to the address of one through the browser returns in browser string "Homework6!".