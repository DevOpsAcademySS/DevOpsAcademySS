import os, sys
import paramiko
import errno

host = sys.argv[1]
port = sys.argv[2]
uname = sys.argv[3]
path = sys.argv[4]
prefix = sys.argv[5]
counts = sys.argv[6]
mode = sys.argv[7]
passwd = 'osboxes.org'

command = 'ls'

if __name__ == '__main__':
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)
    ssh.connect(host, port=port, username=uname, password=passwd)
    stdin, stdout, stderr = ssh.exec_command(f'ls')
    print(stdout.read())
    for i in range(int(counts)):
        ssh.exec_command(f'echo \'{passwd}\'| sudo -S mkdir -m {mode} {path}/{prefix}{str(i+1)}')
        print(f'Folder  {path}/{prefix}{str(i+1)},  is created')

        #ssh.exec_command(f'echo \'{passwd}\'| sudo -S rmdir {path}/{prefix}{str(i+1)}')        #delete folders
    stdin, stdout, stderr = ssh.exec_command(f'ls /home')
    print(stdout.read())
    ssh.close