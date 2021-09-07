from sys import argv
import paramiko


def ssh_conn(address, port, name, path, prefix, counts, mode):
    passwd = 'test'
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(address, port, name, passwd) 
    
    for i in range(1, counts + 1):
        ssh.exec_command("mkdir -m {m} ".format(m=mode)+str(path)+"/"+str(prefix)+str(i))
            
    stdin, stdout, stderr = ssh.exec_command('ls -l')
    print(stdout.readlines())
    ssh.close()


if __name__ == '__main__':
    try:
        arg = argv
        ssh_conn(arg[1],int(arg[2]),arg[3],arg[4], arg[5], int(arg[6]),int(arg[7]))
    except TimeoutError as err:
        print('Connection timeout:', err)