import os
import sys


def create_folder(path_arg, prefix_arg, counts_arg, mode_arg):

    try:
        for i in range(1, counts_arg + 1):
            folder = os.path.join(os.path.expanduser('~'), path_arg, prefix_arg + str(i))

            try:
                os.mkdir(folder, mode_arg)
            except FileExistsError:
                print('Error: File is exist')
            except FileNotFoundError:
                print('Error: File not found')
            else:
                print('Folder is created')

            print('Your path is: {}'.format(folder))
    except ValueError:
        print('Error: Third argument "counts_arg" must be integer')
    print(mode_arg)


if __name__ == '__main__':
    arg = sys.argv
    try:
        create_folder(str(arg[1]), str(arg[2]), int(arg[3]), int(arg[4]))
    except ValueError:
        print('Error: Fourth argument "mode_arg" must be integer')
