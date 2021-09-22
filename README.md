# Ansible

1. Check connection to servers
```
ansible all -m ping
```                                          

2. Check variables of servers
```
 ansible all -m setup
```

3. Execute in `~/ansible/roles/` folder
```
ansible-galaxy init Ubuntu                                          
```
```
ansible-galaxy init ReadHat                                         
```

5. Execute play with passing external variables `db_ip=yor_server_ip` and `web_ip=yor_server_ip`
```
ansible-playbook playbook -e "db_ip=192.168.1.1 web_ip=192.168.1.2" 
```