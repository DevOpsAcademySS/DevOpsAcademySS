from sys import argv
import os
import urllib
import paramiko

# Task: Create a program that generate folders on a remote computer through a SSH connection.

# Input parameters: address, port, name, pass, path, prefix, counts, mode
# python hw3.py 192.168.0.2 22 someuser password /home usr 20 551

# Result of example run: it runs ssh-connect to a remote host 192.168.0.2 using credentinal of 'someuser' and creates there 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551

address = argv[1]
port = argv[2]
name = argv[3]
password = argv[4]

path = argv[5]
prefix = argv[6]
counts = int(argv[7])
mode = argv[8]


def create_folders(path, prefix, counts, mode):
    command = ''
    for i in range(1, counts+1, 1):
        command += f'mkdir -m{mode} -p {path}/{prefix}{i};\n'
    command += 'ls -l'
    print(command)
    return command


command = create_folders(path, prefix, counts, mode)
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

try:
    ssh.connect(address, port, name, password)
    std_in, std_out, std_err = ssh.exec_command(command)
    print(std_out.read())
    ssh.close()
except TimeoutError as err:
    print('Connection timeout:', err)
