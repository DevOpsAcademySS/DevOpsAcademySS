from typing import ClassVar
from diagrams import Diagram
from diagrams import Cluster,Edge
from diagrams.aws.general import User
from diagrams.generic.os import Ubuntu
from diagrams.generic.os import Centos
from diagrams.custom import Custom
from diagrams.onprem.vcs import Github
from diagrams.aws.compute import VmwareCloudOnAWS
from diagrams.generic.os import Centos, Ubuntu
from diagrams.programming.language import Java
from diagrams.onprem.ci import Jenkins
from diagrams.onprem.iac import Ansible
from diagrams.aws.network import Route53
from diagrams.onprem.network import Tomcat
from diagrams.onprem.database import PostgreSQL
from diagrams.onprem.iac import Terraform
from diagrams.onprem.client import Client
#       PART 1

with Diagram("Geocitizen part 1", show=True, direction="TB"):
    
    devOps = User("DevOps")
    

    with Cluster("AWS"):

        with Cluster("Master",direction="LR"):
            jenkins = Jenkins("Jenkins")

            with Cluster("Agents"):
                terraform = Terraform("Terraform")
                agents = terraform

        with Cluster("Nodes"):
            ubuntu = Ubuntu("Ubuntu")
            centos = Centos("Centos")
            nodes = [centos,ubuntu]

        aws = jenkins 
        aws >> Edge() << agents >> nodes

    devOps >> aws

#       PART 2

with Diagram("Geocitizen part 2", show=True, direction="LR"):
    
    
    client = Client('Client')
    terraform = Terraform('Terraform')

    with Cluster('AWS'):

        with Cluster('Nodes', direction='LR'):

            with Cluster('Ubuntu node', direction="LR"):
                ubuntu = Ubuntu('Ubuntu')

                with Cluster('Aplications', direction="LR"):
                    postsql = PostgreSQL('PostgreSQL')

            with Cluster('CentOS node', direction='LR'):
                centos = Centos('CentOS')

                with Cluster('Aplications', 'TB'):
                    maven = Custom(
                        'Maven 3.6', './imgForDiagram/maven.png')
                    nodenpm = Custom('npm', './imgForDiagram/nodejs-npm.png')
                    geocitizen = Custom('Geocitizen', './imgForDiagram/war.png')
                    geocitizen_website = VmwareCloudOnAWS('Geocitizen')
                    route53 = Route53('route53')
                    github = Github('Geocitizen')
                    tomcat = Tomcat('Tomcat 9')
                    java = Java('Java 1.8')
                    github - java - nodenpm - maven - geocitizen - tomcat
                    tomcat - geocitizen_website

        with Cluster('Master'):
            jenkins = Jenkins('Jenkins')

            with Cluster('Agent'):
                ansible = Ansible('Ansible')
                jenkins >> ansible
                ansible >> [ubuntu, centos]

    terraform >> jenkins
    geocitizen_website - Edge(style="dashed") - postsql
    geocitizen_website >> Edge() << route53 >> Edge() << client
