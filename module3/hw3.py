import sys
import paramiko
import getpass

host = sys.argv[1]
port = int(sys.argv[2])

user = sys.argv[3]

foldpath = sys.argv[4]
foldnumb = int(sys.argv[6])+1
foldpref = sys.argv[5]
foldmode = sys.argv[7]
foldname = foldpath + "/" + foldpref 

passw = getpass.getpass(prompt="Please enter password for {userr}: ".format(userr=user))

def main(command):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, port=port, username=user, password=passw) 

    stdin, stdout, stderr = ssh.exec_command(command ,get_pty = True)
    stdin.write(passw + '\n')
    stdin.flush()
    a = stdout.readlines() #stdout needs to output somewhere
    ssh.close()

if __name__ == "__main__":
    for i in range(1,foldnumb):
        main('sudo mkdir '+foldname + str(i))
        main('sudo chmod '+foldmode + " "+foldname + str(i))