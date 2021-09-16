[DB]
%{ for ip in kafka_processors ~}
Ubuntu  ansible_host${ip}
%{ endfor ~}

[web_server]
%{ for ip in test_clients ~}
CentOS  ansible_host=${ip}
%{ endfor ~}