from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2
from urllib.request import urlretrieve
from diagrams.onprem.client import Users
from diagrams.custom import Custom


with Diagram("Geocitizen cloud deploy", show=True, filename="custom_remote"):
    user = Users("DevOps")
    with Cluster("Orchestration"):
        jenkins = Custom("Jenkins", "./logos/jenkins.png")
        
       
        terraform_url = "https://i.pinimg.com/originals/28/ec/74/28ec7440a57536eebad2931517aa1cce.png"
        terraform_icon = "terraform.png"
        urlretrieve(terraform_url, terraform_icon)
        terraform = Custom("Terraform", terraform_icon)
        with Cluster("AWS"):
            with Cluster("Cluster"):
                
                instance1 = EC2("Node OS Ubuntu")
                instance2 = EC2("Node OS RadHat")
                terraform>>instance1
                terraform>>instance2
            instance1-Edge(label="Connection", style="dashed")-instance2
        user>>jenkins
        jenkins>>terraform      
