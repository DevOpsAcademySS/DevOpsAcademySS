import os
import sys

# Task: Create a program that generate folders.

# Input parameters: path, prefix, counts, mode

# Example: python hw1.py /home usr 20 551

# Result of example run: It creates 20 folders on the path /home with names usr1, usr2, etc. and permissions mode 551

folder_path = sys.argv[1]
folder_name = sys.argv[2]
try:
    folder_amount = int(sys.argv[3])
    folder_mode = int(sys.argv[4])
    print('\nPath:', folder_path)
    print('Name:', folder_name)
    print('Amount:', folder_amount)
    print('Mode:', folder_mode, '\n')
    folder_path = os.path.join(os.path.expanduser('~'), folder_path)
    full_path = os.path.join(folder_path, folder_name)
    try:
        for i in range(1, folder_amount+1):
            full_path_i = full_path+str(i)
            os.makedirs(full_path_i, mode=folder_mode, exist_ok=True)
    except OSError as error:
        print('Error: ', error)
    else:
        print(f'All {folder_amount} folders creared at "{folder_path}"\n')
except ValueError as error:
    print('Enter valid number.', error)
