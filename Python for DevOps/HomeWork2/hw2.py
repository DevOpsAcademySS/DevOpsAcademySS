import os
import sys
import json
import re


def get_all_file_names(path_to_files):
    # create empty list for "json" file names
    files = []
    # walk trought all files
    for (dirpath, dirnames, filenames) in os.walk(path_to_files):
        for filename in filenames:
            # check if file ends with ".json"
            if re.search('.json$', filename):
                # if valid append to list
                files.append(filename)
        break
    return files


def validate_json_and_write_result(files, path_to_files, path_to_result):
    # check if list is empty
    if len(files) > 0:
        # set initial number and dictionary
        number = 0
        res_dict = {}
        # loop trought all files
        for file in files:
            # get the full path with file name
            path_to_file = os.path.join(path_to_files, file)
            # read each file
            with open(path_to_file, 'r') as json_file:
                # convert from "json" to dictioonary
                json_dict = json.load(json_file)
                # check if json is dictionary
                if type(json_dict) == dict:
                    # check if "result" key in dictionary and value is non-zero
                    if 'result' in json_dict and json_dict['result'] != 0:
                        # if true create a dictionary
                        if number < int(json_dict['number']):
                            number = int(json_dict['number'])
                            res_dict = {'id': json_dict['id'],
                                        'number': json_dict['number'],
                                        'committer_name': json_dict['committer_name'],
                                        'committer_email': json_dict['committer_email']}
        # open "result.json" file and write the result
        with open(path_to_result, 'w') as json_result:
            try:
                json_result.write(json.dumps(res_dict))
            except TypeError as err:
                print("TYPE ERROR:", err)
        return res_dict


# get path to "json" files
path_to_files = sys.argv[1]
# get path to "result.json" file
path_to_result = sys.argv[2]
files = get_all_file_names(path_to_files)
res_dict = validate_json_and_write_result(files, path_to_files, path_to_result)

print('\nPath to files: \t\t', path_to_files)
print('Path to result file: \t', path_to_result)
print('All "json" files: \t', files)
print('Result dictionary: \t', res_dict, '\n')
