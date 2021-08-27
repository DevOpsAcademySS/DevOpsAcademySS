import os, sys
import subprocess

path = os.path.join(sys.argv[1], sys.argv[2])
count = int(sys.argv[3])
mode = "0" + str(sys.argv[4])
for x in range(1, count + 1):
    os.mkdir(path + str(x))
    subprocess.call(['chmod', mode, path + str(x)])
