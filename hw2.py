import errno
import os
import sys
import json


def json_parse(path_to_file, path_to_result):
    try:
        import_file = open(os.path.join(os.path.expanduser('~'), path_to_file))
        full_path_to_result = os.path.join(os.path.expanduser('~'), path_to_result)
    except OSError as exc:
        if exc.errno == errno.ENOENT:
            print('No such file or directory(', path_to_file, ')')
    else:
        commits_data = json.load(import_file)
        import_file.close()
    success_commit_flag = False
    data = {
        'number': 0,
    }
    for commit in commits_data["matrix"]:
        if commit['result'] != 0:
            success_commit_flag = True
            if commit['number'] > data['number']:
                data = {
                    'id': commit['id'],
                    'number': commit['number'],
                    'committer_name': commits_data['committer_name'],
                    'committer_email': commits_data['committer_email']
            }
    if success_commit_flag:
        print(json.dumps(data))
        try:
            with open(full_path_to_result, 'w') as f:
                f.write(json.dumps(data))
                # json.dumps(data, f)
        except OSError as exc:
            if exc.errno == errno.EPERM:
                print('Operation not permitted to create file', full_path_to_result)
            if exc.errno == errno.ENOENT:
                print('No such file or directory(', full_path_to_result, ')')
            if exc.errno == errno.ENOMEM:
                print('Out of memory')
            if exc.errno == errno.EACCES:
                print('Permission denied to create file', full_path_to_result)
            if exc.errno == errno.ENOSPC:
                print('No space left on device to create file', full_path_to_result)
            if exc.errno == errno.EROFS:
                print('Read-only file system')
            if exc.errno == errno.ELOOP:
                print('Too many symbolic links encountered to create file', full_path_to_result)
            if exc.errno == errno.ENAMETOOLONG:
                print('File name too long to create file', full_path_to_result)
        else:
            print("Success")


if __name__ == '__main__':
    json_parse(sys.argv[1], sys.argv[2])
