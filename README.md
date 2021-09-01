# Python for DevOps

---

## Module 1. Homework

> **Task:** _Create a program that generate folders._
> **Input parameters:** _path, prefix, counts, mode_
> **Example:** `python hw1.py /home usr 20 551`
> **Result of example run:** _It creates 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551._

## Module 2. Homework

> **Task:** _There are a set of JSON-files that contains answers from the CI server. An example of such is attached **[hw2_example.json]**. Create a program that returns JSON-file which contains 'id', 'number', 'committer_name' and 'committer_email' from last of failed builds (in other words - with the highest value of 'number' and non-zero 'result')._
> **Input parameters:** _path_to_files, path_to_result_
> **Example:** `python hw2.py /home/usr/data_json /home/usr/result.json`
> **Result of example run:** _it reads all files on the path /home/usr/data_json and writes on the file /home/usr/result.json the necessary information like this:_
```json
{"id": 22, "number": "34", "committer_name": "Some Commiter", "committer_email": "some.commiter@gmail.com"}
```

## Module 3. Homework

> **Task:** _Create a program that generate folders on a remote computer through a SSH connection._
> **Input parameters:** _address, port, name, path, prefix, counts, mode_
> **Example:** `python hw3.py 192.168.0.2 22 someuser /home usr 20 551`
> **Result of example run:** _It runs ssh-connect to a remote host 192.168.0.2 using credentinal of 'someuser' and creates there 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551._

## Module 4. Homework

> **Task:** _There is some rpm-file. Create program that outputs header field rpm.RPMTAG_RELEASE of this file._
> **Input parameters:** _path_
> **Example:** `python hw4.py /home/usr/some_file.rpm`
> **Result of example run:** _It reads header of the file /home/usr/some_file.rpm and print field like this:_
```
5.rel8.centos.
```

## Module 5. Homework

> **Task:** _There is some SQLite database **[example.db]**. Create program that sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'._
> **Input parameters:** _path_
> **Example:** `python hw5.py /home/usr/example.db`
> **Result of example run:** _It sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'._

## Module 6. Homework

> **Task:** _Write program that creates a Docker image that based on image **[centos7/hw]** (which need to import) and contains a simple Web applications is that displays in a browser "Homework6!”._
> **Input parameters:** _tag_name_
> **Example:** `python hw6.py homework:6`
> **Result of example run:** _It creates new Docker image with name 'homework:6' and based on image 'centos7/hw'. The command: `docker run homework:6` starts the container. The connection to the address of one through the browser returns in browser string "Homework6!"._

[centos7/hw]:(https://softserve.academy/pluginfile.php/11894/mod_assign/intro/centos7_hw.tar)
[example.db]:(https://softserve.academy/pluginfile.php/11889/mod_assign/intro/hw5_example.db)
[hw2_example.json]:(https://softserve.academy/pluginfile.php/11775/mod_assign/intro/hw2_example.json)