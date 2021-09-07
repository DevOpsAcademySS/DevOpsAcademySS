#! /usr/bin/env python3

from sys import argv
import rpmfile
import os

file_path = argv[1]

try:
    if file_path.endswith('.rpm'):
        with rpmfile.open(file_path) as rpm_file:
            print(rpm_file.headers.keys())
    else:
        frmt = file_path.split('.').pop()
        print(f"Incorrect file format [.{frmt}], expected [.rpm] .")
except OSError:
    print('Error of file name ')
else:
    print("success")
