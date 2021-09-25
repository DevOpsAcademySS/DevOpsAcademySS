from diagrams import Diagram, Cluster, Edge
from diagrams.custom import Custom
from diagrams.onprem.vcs import Github
from diagrams.aws.compute import VmwareCloudOnAWS
from diagrams.generic.os import Ubuntu
from diagrams.programming.language import Java
from diagrams.onprem.ci import Jenkins
from diagrams.onprem.iac import Ansible
from diagrams.aws.network import Route53
from diagrams.onprem.network import Tomcat
from diagrams.onprem.database import PostgreSQL
from diagrams.onprem.client import Client
from diagrams.aws.security import Artifact
from diagrams.aws.devtools import Codebuild
from diagrams.onprem.iac import Awx

with Diagram("Diagrams as a Code 3", show=True, direction="LR"):

    client = Client('Client')
    geo_build = Codebuild('Build Geocitizen')

    with Cluster('AWS'):
        with Cluster('Cluster', direction='LR'):

            with Cluster('Ubuntu node'):
                ubuntu = Ubuntu('Ubuntu')
                with Cluster('Aplications'):
                    postsql = PostgreSQL('PostgreSQL')

            with Cluster('Amazon node', 'TB'):
                amazon = Custom(
                    'Amazon Linux', './Data visualisation/icons/amazon-linux.png')
                with Cluster('Aplications', 'TB'):
                    geo_artifact = Artifact('Geocitizen Artifact')
                    geocitizen = Custom(
                        'geocitizen.war', './Data visualisation/icons/war.png')
                    geocitizen_website = VmwareCloudOnAWS('Geocitizen')
                    github = Github('Geocitizen')
                    tomcat = Tomcat('Tomcat 9')
                    java = Java('Java 1.8')
                    github - java - geo_artifact - geocitizen - tomcat
                    tomcat - geocitizen_website

            ansible = Ansible('Ansible')
            ansible >> [ubuntu, amazon]

        with Cluster('Master'):
            jenkins = Jenkins('Jenkins')
            with Cluster('Agent'):
                awx = Awx('AWX')
                jenkins >> awx >> ansible

    geo_build >> jenkins
    geocitizen_website - Edge(style="dashed") - postsql
    geocitizen_website >> Edge() << client
