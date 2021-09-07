from diagrams import Cluster, Diagram, Edge
from diagrams.aws.network import Route53
from urllib.request import urlretrieve
from diagrams.onprem.database import PostgreSQL
from diagrams.gcp.iot import IotCore
from diagrams.programming.language import Java
from diagrams.onprem.client import Client
from diagrams.custom import Custom

with Diagram("Geocitizen cloud deploy", show=True, filename="custom_remote"):
    terraform_url = "https://i.pinimg.com/originals/28/ec/74/28ec7440a57536eebad2931517aa1cce.png"
    terraform_icon = "terraform.png"
    urlretrieve(terraform_url, terraform_icon)
    terraform = Custom("Terraform", terraform_icon)
    r53 = Route53 ("Load balancer")
    client = Client("User")

    with Cluster("Orchestration"):
        jenkins = Custom("Jenkins", "./logos/jenkins.png")
        terraform>>Edge(label="Infrastucture OK")>>jenkins
        with Cluster("Configuration management"):
            ansible = Custom("Ansible", "./logos/ansible.png")

            
            jenkins>>ansible
    with Cluster("AWS"):
        with Cluster("Cluster"):
            with Cluster("Node OS RadHat"):

                java = Java("Java")
                npm = Custom("npm", "./logos/npm.png")
                maven = Custom("Maven", "./logos/maven.png")
                war_file = Custom("Geocitizen application", "./logos/war_file.png")
                webserver = Custom("Tomcat Webserver", "./logos/tomcat.png")
                geo = IotCore("Geocitizen")
                redhat = Custom("Red Hat", "./logos/redhat.png")

                ansible>>redhat
                java-npm-maven-war_file-webserver-geo

            with Cluster("Node OS Ubuntu"):
                database = PostgreSQL("PostgreQSL DB")
                ubuntu = Custom("OS Ubuntu", "./logos/ubuntu.png")
                ansible>>ubuntu

                geo-Edge(style="dashed")-database

    geo>>Edge(label="")<<r53>>Edge(label="")<<client
