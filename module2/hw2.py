import os, sys, json

data = []
data_res = {}
infile = sys.argv[1]
outfile = sys.argv[2]
for file in os.listdir(infile):
    json_path = os.path.join(infile, file)
    with open(json_path, 'r') as f:
        json_data = json.load(f)
        data.append(json_data)
maxnumb_data = []
first_ndata = {}
for data_i in data:
    if data_i["result"] != 0:
        for key,val in data_i.items():
            if key == "committer_name":
                data_res[key] = val
            if key == "committer_email":
                data_res[key] = val
            if key == "number":
                first_ndata[key] = val
            if key == "id":
                first_ndata[key] = val
                maxnumb_data.append(first_ndata)
                
            if key == "matrix":
                for matr_data in val:
                    if matr_data["result"] != 0:
                        maxnumb_data.append(matr_data)
                   
    else: 
        for key,val in data_i.items():
            if key == "matrix":
                for matr_data in val:
                    if matr_data["result"] != 0:
                        maxnumb_data.append(matr_data)

            if key == "committer_name":
                data_res[key] = val
            if key == "committer_email":
                data_res[key] = val
    try:
        maxnumb=max(maxnumb_data, key=lambda ev: ev["number"])
        for key,val in maxnumb.items():
            if key == "number":
                data_res[key]=val
            if key == "id":
                data_res[key]=val
        with open(outfile, 'w') as f:
            json.dump(data_res, f)
    except:
        print("no failed builds found")
        with open(outfile, 'w') as f:
            json.dump(maxnumb_data, f)