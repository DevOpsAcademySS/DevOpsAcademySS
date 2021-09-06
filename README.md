### KOZAK MYKOLA
# Core Bash
**Task:** Make a script, that will run your python script ([hw2.py](hw2.py)) from module 2 Python for DevOps. Also check if the name of the running file is `hw2.py`, if not, then display the appropriate message.

**Script name:** [core_bash.sh](core_bash.sh)


**Example:** `./core_bash.sh hw2.py /home/usr/data_json`

**Result of example run:** script executes the program, that reads all files on the path `/home/usr/data_json` and writes on the file `/home/usr/result.json` the necessary information like this:
```
{"id": 22, "number": "34", "committer_name": "Some Commiter", "committer_email": "some.commiter@gmail.com"}
```