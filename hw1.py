#! /usr/bin/env python3

import os, sys
from os.path import exists

path=sys.argv[1]
prefix=sys.argv[2]
counts=int(sys.argv[3])
mode=int(sys.argv[4])



for i in range(counts):
    fld = path+'/'+prefix+str(i+1)
    if not exists(fld):
        try:
            os.mkdir(fld, mode)
        except OSError:
            print('Cannot create folder ', fld)
        else:
            print('Folder ', fld, ' created successfully')
