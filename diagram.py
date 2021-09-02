from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB
from diagrams.aws.general import Users
from diagrams.custom import Custom

with Diagram("Web Service", show=True):
	Web = Custom(label="Geocotizen",icon_path="./web.png")
	w = Web	
	with Cluster("Setup"):
		Jenkins = Custom(label="\nJenkins",icon_path="./Jenkins_logo.svg")
		j = Jenkins
		 
		Terraform = Custom(label="Terraform",icon_path="./1686023.png")
		t = Terraform
		Ansible = Custom(label="",icon_path="./Ansible_logo.svg")
		a = Ansible
		j >> Edge() << t
		j >> a
	with Cluster("aws", direction="TB"):
		serv1 = EC2("serv") 
		serv2 = EC2("serv_database")
		serv1 >> Edge() << serv2
		aws = [serv1,serv2]
	Users("devops")>> j
	a >> aws
	t >> aws
	serv1 >> w >> Edge() << Users("Users")