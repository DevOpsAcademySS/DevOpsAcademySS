#! /usr/bin/env python3

from sys import argv
import paramiko
import getpass

address = argv[1]
port = argv[2]
name = argv[3]

path = argv[4]
prefix = argv[5]
counts = argv[6]
mode = argv[7]

passw = getpass.getpass(prompt="{userr}@{address}'s password: ".format(userr=name, address=address))

command = 'python3 hw1.py ' + path + ' ' + prefix + ' ' + counts + ' ' + mode
print(command)

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

try:
    ssh.connect(address, port, name, passw)
    std_in, std_out, std_err = ssh.exec_command(command)
    print(std_out.read())
    ssh.close()
except TimeoutError as err:
    print('Connection timeout:', err)
