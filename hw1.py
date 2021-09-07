import errno
import os
import sys


def create_folders(path, prefix, counts, mode):
    for i in range(int(counts)):
        fld = os.path.join(os.path.expanduser('~'), path, prefix + str(i+1))
        print(fld)
        try:
            os.mkdir(fld, int(mode))

        except OSError as exc:
            if exc.errno == errno.EEXIST:
                print('Folder ', prefix + str(i+1), ' is already created')
            if exc.errno == errno.EPERM:
                print('Operation not permitted to create folder', prefix + str(i+1))
            if exc.errno == errno.ENOENT:
                print('No such file or directory(', fld, ')')
            if exc.errno == errno.ENOMEM:
                print('Out of memory')
            if exc.errno == errno.EACCES:
                print('Permission denied to create folder', prefix + str(i+1))
            if exc.errno == errno.ENOSPC:
                print('No space left on device to create folder', prefix + str(i+1))
            if exc.errno == errno.EROFS:
                print('Read-only file system')
            if exc.errno == errno.ELOOP:
                print('Too many symbolic links encountered to create folder', prefix + str(i+1))
            if exc.errno == errno.ENAMETOOLONG:
                print('File name too long to create folder', prefix + str(i+1))
        else:
            print('Folder ', prefix + str(i+1), ' is created')


if __name__ == '__main__':
    create_folders(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
