# Python for DevOps
## Module 1. Operating System interfaces
**Task:** Create a program that generate folders.
**Program name:** hw1.py
How to run:
```
python hw1.py /home usr 20 551
```
**Result of run:** It creates 20 folders on the path */home* with names usr1, usr2, etc. and permissions mode 551
## Module 2. Text
**Task:** There are a set of JSON-files that contains answers from the CI server. An example of such is attached [hw2_example.json](https://softserve.academy/pluginfile.php/11775/mod_assign/intro/hw2_example.json). Create a program that returns JSON-file which contains 'id', 'number', 'committer_name' and 'committer_email' from last of failed builds (in other words - with the highest value of 'number' and non-zero 'result').
**Program name:** hw2.py
**Input parameters:** path_to_files, path_to_result
How to run:
```
python hw2.py /home/usr/data_json /home/usr/result.json
```
**Result of example run:** it reads all files on the path */home/usr/data_json* and writes on the file */home/usr/result.json* the necessary information like this:

{"id": 22, "number": "34", "committer_name": "Some Commiter", "committer_email": "some.commiter@gmail.com"}
