# Python for DevOps
## Module 1. Operating System interfaces
**Task:** Create a program that generate folders.

**Program name:** hw1.py

How to run:
```
python3 hw1.py /home usr 20 551
```
**Result of run:** It creates 20 folders on the path */home* with names usr1, usr2, etc. and permissions mode 551
## Module 2. Text
**Task:** There are a set of JSON-files that contains answers from the CI server. An example of such is attached [hw2_example.json](https://softserve.academy/pluginfile.php/11775/mod_assign/intro/hw2_example.json). Create a program that returns JSON-file which contains 'id', 'number', 'committer_name' and 'committer_email' from last of failed builds (in other words - with the highest value of 'number' and non-zero 'result').

**Program name:** hw2.py

**Input parameters:** path_to_files, path_to_result

How to run:
```
python3 hw2.py /home/usr/data_json /home/usr/result.json
```
**Result of example run:** it reads all files on the path */home/usr/data_json* and writes on the file */home/usr/result.json* the necessary information like this:

{"id": 22, "number": "34", "committer_name": "Some Commiter", "committer_email": "some.commiter@gmail.com"}
## Module 3. Networking
**Task:** Create a program that generate folders on a remote computer through a SSH connection.

**Program name:** hw3.py

**Input parameters:** address, port, name, path, prefix, counts, mode

How to run:
```
python3 hw3.py 192.168.0.2 22 someuser /home usr 20 551
```
**Result of example run:** it runs ssh-connect to a remote host 192.168.0.2 using credentinal of 'someuser' and creates there 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551

## Module 4. Packaging
**Task:** There is some rpm-file. Create program that outputs header field rpm.RPMTAG_RELEASE of this file.

**Program name:** hw4.py

**Input parameters:** path

How to run:
```
python3 hw4.py /home/usr/some_file.rpm
```
**Result of example run:** It reads header of the file /home/usr/some_file.rpm and print field

## Module 5. Databases
**Task:** There is some SQLite database [example.db](https://softserve.academy/pluginfile.php/11889/mod_assign/intro/hw5_example.db). Create program that sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'.

**Program name:** hw5.py

**Input parameters:** path

How to run:
```
python3 hw5.py /home/usr/example.db
```
