from diagrams import Cluster, Diagram
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB
from diagrams.aws.general import Users
from diagrams.custom import Custom

with Diagram("Web Service", show=True):
	Jenkins = Custom(label="\nJenkins",icon_path="./Jenkins_logo.svg")
	j = Jenkins
	Web = Custom(label="Geocotizen",icon_path="./web.png")
	w = Web	 
	Terraform = Custom(label="Terraform",icon_path="./1686023.png")
	t = Terraform
	Ansible = Custom(label="",icon_path="./Ansible_logo.svg")
	a = Ansible
	with Cluster("aws"):
		serv1 = EC2("serv") 
		serv2 = EC2("serv_database")
		serv1 - serv2
		aws = [serv1,serv2]
	Users("DevOps") >> j >> t >> aws
	t >> j
	aws >> w << Users("Users")
	j >> a >> aws	