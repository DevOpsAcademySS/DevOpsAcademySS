# DevOpsAcademySS

#### [Python for DevOps](#pfd):

1. **[Module 1. Homework](#m1hw)**
2. **[Module 2. Homework](#m2hw)**
3. **[Module 3. Homework](#m3hw)**
4. **[Module 4. Homework](#m4hw)**
5. **[Module 5. Homework](#m5hw)**
6. **[Module 6. Homework](#m6hw)**

#### [Assignment for regex](#afr) 
#### [Data visualisaton](#dv) 

---

# <a name="pfd"></a> Python for DevOps

---

## Module 1. Homework <a name="m1hw"></a>

 **Task:** _Create a program that generate folders._
 
 **Program name:** [_hw1.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-141-andre-python-for-devops/Python%20for%20DevOps/HomeWork1/hw1.py)
 
 **Input parameters:** _path, prefix, counts, mode_
 
 **Example:** `python hw1.py /home usr 20 551`
 
 **Result of example run:** _It creates 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551._

## Module 2. Homework <a name="m2hw"></a>

 **Task:** _There are a set of JSON-files that contains answers from the CI server. An example of such is attached **[hw2_example.json]**. Create a program that returns JSON-file which contains 'id', 'number', 'committer_name' and 'committer_email' from last of failed builds (in other words - with the highest value of 'number' and non-zero 'result')._
 
  **Program name:** [_hw2.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-141-andre-python-for-devops/Python%20for%20DevOps/HomeWork2/hw2.py)
 
 **Input parameters:** _path_to_files, path_to_result_
 
 **Example:** `python hw2.py /home/usr/data_json /home/usr/result.json`
 
 **Result of example run:** _it reads all files on the path /home/usr/data_json and writes on the file /home/usr/result.json the necessary information like this:_
```json
{"id": 22, "number": "34", "committer_name": "Some Commiter", "committer_email": "some.commiter@gmail.com"}
```

## Module 3. Homework <a name="m3hw"></a>

 **Task:** _Create a program that generate folders on a remote computer through a SSH connection._
 
   **Program name:** [_hw3.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-141-andre-python-for-devops/Python%20for%20DevOps/HomeWork3/hw3.py)
 
 **Input parameters:** _address, port, name, path, prefix, counts, mode_
 
 **Example:** `python hw3.py 192.168.0.2 22 someuser /home usr 20 551`
 
 **Result of example run:** _It runs ssh-connect to a remote host 192.168.0.2 using credentinal of 'someuser' and creates there 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551._

## Module 4. Homework <a name="m4hw"></a>

 **Task:** _There is some rpm-file. Create program that outputs header field rpm.RPMTAG_RELEASE of this file._
 
   **Program name:** [_hw4.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-141-andre-python-for-devops/Python%20for%20DevOps/HomeWork4/hw4.py)
 
 **Input parameters:** _path_
 
 **Example:** `python hw4.py /home/usr/some_file.rpm`
 
 **Result of example run:** _It reads header of the file /home/usr/some_file.rpm and print field like this:_
```
5.rel8.centos.
```

## Module 5. Homework <a name="m5hw"></a>

 **Task:** _There is some SQLite database **[example.db]**. Create program that sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'._
 
 **Program name:** [_hw5.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-141-andre-python-for-devops/Python%20for%20DevOps/HomeWork5/hw5.py)
 
 **Input parameters:** _path_
 
 **Example:** `python hw5.py /home/usr/example.db`
 
 **Result of example run:** _It sets in database ports (ServerPorts.port_number) to 443 for all servers apache (ServerTypes.type_name is 'apache') in project 'Project3'._

## Module 6. Homework <a name="m6hw"></a>

 **Task:** _Write program that creates a Docker image that based on image **[centos7/hw]** (which need to import) and contains a simple Web applications is that displays in a browser "Homework6!”._
 
  **Program name:** [_hw6.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-141-andre-python-for-devops/Python%20for%20DevOps/HomeWork6/hw6.py)
 
 **Input parameters:** _tag_name_
 
 **Example:** `python hw6.py homework:6`
 
 **Result of example run:** _It creates new Docker image with name 'homework:6' and based on image 'centos7/hw'. The command: `docker run homework:6` starts the container. The connection to the address of one through the browser returns in browser string "Homework6!"._

---

# Assignment for regex <a name="afr"></a>


##### Write down the shortest regular expressions that will match:

1. All forms of your last name;

2. All forms of your name (you can consider diminutive or other options); 

3. All telephone codes of regional centers and other large cities of the part of Ukraine where your parents live (North, South, East, West, Center - the division is approximate, you can see in the weather forecast), - or analog of such information for your country; 

4. Show on the screen a list of all system users who have a Bash shell.

5. Show all lines from the _/etc/group_ file starting with the "daemon" character sequence.

6. Show all lines from the same file that do not contain it.

7. How many README files do these subdirectories contain, not including "README.a_string" files?

8. With *grep | awk | sed | find* show a list of files (excluding directories) in your home directory that changed less than 10 hours ago?

9. Put all these commands in a script file that will output the full output.

---

# Data visualisaton <a name="dv"></a>

1. [_lifecycle_diagram_1.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-117-andre-diagrams-as-code/Data%20visualisation/lifecycle_diagram_1.py)
> ![diagrams_as_a_code_1.png](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-117-andre-diagrams-as-code/Data%20visualisation/diagrams_as_a_code_1.png)

2. [_lifecycle_diagram_2.py_](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-117-andre-diagrams-as-code/Data%20visualisation/lifecycle_diagram_2.py)
> ![diagrams_as_a_code_2.png](https://github.com/DevOpsAcademySS/DevOpsAcademySS/blob/IA-117-andre-diagrams-as-code/Data%20visualisation/diagrams_as_a_code_2.png)



[centos7/hw]:<https://softserve.academy/pluginfile.php/11894/mod_assign/intro/centos7_hw.tar>
[example.db]:<https://softserve.academy/pluginfile.php/11889/mod_assign/intro/hw5_example.db>
[hw2_example.json]:<https://softserve.academy/pluginfile.php/11775/mod_assign/intro/hw2_example.json>

