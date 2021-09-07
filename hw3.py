import os, sys, paramiko

host, port, user = sys.argv[1], int(sys.argv[2]), sys.argv[3]
path = os.path.join(sys.argv[4], sys.argv[5])
count = int(sys.argv[6])
mode = "0" + str(sys.argv[7])
key = paramiko.RSAKey.from_private_key_file(sys.argv[8])

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect(hostname=host, username=user, port=port, pkey=key)

for x in range(1, count + 1):
    client.exec_command('sudo mkdir '+path + str(x))
    client.exec_command('sudo chmod ' + mode +" "+ path + str(x))

stdin, stdout, stderr = client.exec_command("ls /home")
print(stdout.readlines())
client.close()
