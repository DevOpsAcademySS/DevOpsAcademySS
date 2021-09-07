#!/bin/bash

scriptName="$1"
python $1 /home/serhii/data_json.json /home/serhii/result.json
ls -l
if  [ "$1" == "hw2.py" ]; then
        echo "We start $1 script"
else echo "Script is not hw2.py!"
fi