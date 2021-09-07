from os.path import join
from os import listdir
from json import load, dump
from sys import argv

def found_dict(sort_lst):
    result = None
    var_number = []
    for high_num in sort_lst:
        var_number.append(float(high_num['number']))
        if float(high_num['number']) == max(var_number):
            result = high_num
    return result


def sort_list_of_dict(input_list_dict):
    sorted_list = []
    for item in input_list_dict:
        if item['config']['.result'] != 0:
            sorted_list.append(item)
    return sorted_list


def find_elem_of_dict_for_json(json_dat):
    dict_for_work = found_dict(sort_list_of_dict(json_dat['matrix']))
    result_dict_for_json = dict()
    result_dict_for_json.update({'id': dict_for_work['id']})
    result_dict_for_json.update({'number': dict_for_work['number']})
    result_dict_for_json.update({'committer_name': json_dat['committer_name']})
    result_dict_for_json.update({'committer_email': json_dat['committer_email']})
    return result_dict_for_json


def create_result_json(path_to_files, path_to_result):
    folder = join(path_to_files)
    # Suffix for "endswith" function
    suffix = '.json'
    # Cycle, which find in "path_to_files" files *.json and open it for work
    path_to_result_json = join(path_to_result, 'result.json')
    for file in listdir(folder):
        if not file.endswith(suffix):
            continue
        with open(join(folder, file)) as imported_file:
            json_data = load(imported_file)
            with open(path_to_result_json, 'a') as file_to_write:
                dump(find_elem_of_dict_for_json(json_data), file_to_write, indent=4)


if __name__ == '__main__':
    create_result_json(str(argv[1]), str(argv[1]))
