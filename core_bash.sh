#!/bin/bash
file=$1

dir=$2 #data_json

if [[ "$file" == "hw2.py" ]]; then
    python $file $dir result.json
    ll
else
    echo "you are trying to run the wrong python script"
fi