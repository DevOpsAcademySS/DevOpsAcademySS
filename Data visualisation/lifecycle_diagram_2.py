from diagrams import Diagram, Cluster, Edge
from diagrams.custom import Custom
from diagrams.onprem.vcs import Github
from diagrams.aws.compute import VmwareCloudOnAWS
from diagrams.generic.os import Centos, Ubuntu
from diagrams.programming.language import Java
from diagrams.onprem.ci import Jenkins
from diagrams.onprem.iac import Ansible

from diagrams.onprem.network import Tomcat
from diagrams.onprem.database import PostgreSQL

from diagrams.onprem.client import Client


with Diagram("Diagrams as a Code 2", show=True, direction="LR"):

    client = Client('Client')

    with Cluster('AWS'):
        geocitizen_website = VmwareCloudOnAWS('Geocitizen')

        with Cluster('Cluster', direction='LR'):

            with Cluster('Ubuntu node'):
                ubuntu = Ubuntu('Ubuntu')

                with Cluster('Aplications'):
                    postsql = PostgreSQL('PostgreSQL')

            with Cluster('CentOS node', 'TB'):
                centos = Centos('CentOS')

                with Cluster('Aplications', 'TB'):
                    maven = Custom(
                        'Maven 3.6', './icons/Apache_Maven_logo.svg.png')
                    geocitizen = Custom('Geocitizen', './icons/war.png')
                    github = Github('Geocitizen')
                    tomcat = Tomcat('Tomcat 9')
                    java = Java('Java 1.8')
                    github - java - maven - geocitizen - tomcat
                    tomcat >> geocitizen_website

        with Cluster('Master'):
            jenkins = Jenkins('Jenkins')

            with Cluster('Agent'):
                ansible = Ansible('Ansible')
                jenkins >> ansible
                ansible >> [ubuntu, centos]

    geocitizen_website - Edge(style="dashed") - postsql
    geocitizen_website >> Edge() << client
