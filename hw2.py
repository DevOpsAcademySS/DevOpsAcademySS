#! /usr/bin/env python3

import os, sys, json

path_to_files = sys.argv[1]
path_to_result = sys.argv[2]
number = 0

# getting all json files from path_to_files
json_files = [pos_json for pos_json in os.listdir(path_to_files) if pos_json.endswith('.json')]
print("scanning such files: ", json_files)

# operating the files
for filename in json_files:
    import_file = open(filename)            # open import_file
    import_data = json.load(import_file)    # read import_file
    import_file.close()                     # close import_file

    committer_name = import_data['committer_name']      # get committer_name
    committer_email = import_data['committer_email']    # get committer_email

    # get id and number of build with the most number
    for section in import_data['matrix']:
        if not section['result'] == 0:
            if float(section['number']) > float(number):
                number = section['number']
                id = section['id']
    
result = {}
result['id'] = id
result['number'] = number
result['committer_name'] = committer_name
result['committer_email'] = committer_email

export_file = open(path_to_result, 'w+')
export_file.write(json.dumps(result))
export_file.close()