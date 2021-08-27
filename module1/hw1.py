import os,sys
foldname = ''
foldpath = sys.argv[1]
foldnumb = int(sys.argv[3])+1
foldpref = sys.argv[2]
foldmode = int('0o' + sys.argv[4],8)
try:
    for i in range(1,foldnumb):
        foldname = os.path.join(foldpath,foldpref+str(i))
        os.mkdir(foldname,foldmode)
except OSError as error: 
    print(error)
else:
    print('Folders are created')