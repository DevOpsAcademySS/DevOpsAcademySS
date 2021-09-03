from diagrams import Diagram, Cluster, Edge
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


with Diagram("Diagrams as a Code 2", show=True, direction="LR"):

    client = Client('Client')
    terraform = Terraform('Terraform')

    with Cluster('AWS'):

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
                    nodenpm = Custom('npm', './icons/nodejs-npm.png')
                    geocitizen = Custom('Geocitizen', './icons/war.png')
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
