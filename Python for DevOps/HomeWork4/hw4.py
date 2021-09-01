from sys import argv
import rpmfile
import os

# Task: There is some rpm-file. Create program that outputs header field rpm.RPMTAG_RELEASE of this file.

# Input parameters: path
# Example: python hw4.py /home/usr/some_file.rpm

# Result of example run: it reads header of the file /home/usr/some_file.rpm and print field like this: 5.rel8.centos

file_path = argv[1]
if os.path.isfile(file_path):
    if file_path.endswith('.rpm'):
        with rpmfile.open(file_path) as rpm_file:
            # print(rpm_file.headers.keys())
            print('\nRelease:...', rpm_file.headers['release'])
    else:
        frmt = file_path.split('.').pop()
        print(f"Incorect file format [.{frmt}], expected [.rpm] .")
else:
    print("Incorect path or file name.")
