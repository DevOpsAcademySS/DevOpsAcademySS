from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2
from diagrams.aws.general import Users
from diagrams.onprem.iac import Terraform, Ansible
from diagrams.onprem.ci import Jenkins
from diagrams.oci.connectivity import DNS

with Diagram("Geocitizen", show=True):
	dns = DNS("Route 53")
	with Cluster("Setup"):
		Jnkns = Jenkins("Jenkins")
		Trrfrm = Terraform("")
		Ansbl = Ansible("Ansible")
		Jnkns >> Edge() << Trrfrm
		Jnkns >> Ansbl
	with Cluster("aws", direction="TB"):
		serv1 = EC2("serv") 
		serv2 = EC2("serv_database")
		serv1 >> Edge() << serv2
		aws = [serv1,serv2]
	Users("devops")>> Jnkns
	Ansbl >> aws
	Trrfrm >> aws
	serv1 >> dns >> Edge() << Users("Users")