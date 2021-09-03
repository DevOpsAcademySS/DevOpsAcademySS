from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2
from diagrams.aws.general import Users
from diagrams.onprem.iac import Terraform
from diagrams.onprem.ci import Jenkins

with Diagram("Geocitizen Infrastructure", show=True):
	with Cluster("Setup"):
		Jnkns = Jenkins("Jenkins")
		Trrfrm = Terraform("")
		Jnkns >> Edge() << Trrfrm
	with Cluster("aws", direction="TB"):
		serv1 = EC2("serv") 
		serv2 = EC2("serv_database")
		aws = [serv1,serv2]
	Users("devops")>> Jnkns
	Trrfrm >> aws