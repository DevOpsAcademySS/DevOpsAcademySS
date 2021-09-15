#!/bin/bash
testVariable=$1

if [[ $testVariable == "hw2.py" ]]; then
  python3 $testVariable data_json.json result.json
  ls
else
  echo "enter please patch to hw2.py"
fi