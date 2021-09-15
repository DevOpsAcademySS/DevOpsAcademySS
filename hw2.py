import sys, json

path_to_files, path_to_result = sys.argv[1], sys.argv[2]
data = json.load(open(path_to_files, "r"))

res_no_0 = []
oll_res = []
for i in data["matrix"]:
    oll_res.append(i["number"])
    if i["result"] != 0:
        res_no_0.append(i["number"])
IHV = oll_res.index(max(res_no_0))

result = {"id": data["matrix"][IHV]["id"], "number": data["matrix"][IHV]["number"],
          "committer_name": data["committer_name"], "committer_email": data["committer_email"], }

json.dump(result, open(path_to_result, "w"))
print(result)


