#! /usr/bin/env python3

from diagrams import Cluster, Diagram, Edge

from diagrams.aws.compute import EC2
from diagrams.onprem.client import Client
from diagrams.onprem.network import Tomcat
from diagrams.onprem.database import Postgresql

from diagrams.onprem.ci import Jenkins
from diagrams.onprem.iac import Terraform
from diagrams.onprem.iac import Ansible

from diagrams.custom import Custom


with Diagram("Job1", show=False):

    with Cluster("Orchestration"):
        jenkins = Jenkins("Jenkins")

    terraform = Terraform("")

    with Cluster("AWS"):
        with Cluster("CentOS node"):
            centos = EC2("CentOS")
        with Cluster("Ubuntu node"):
            ubuntu = EC2("Ubuntu")

    jenkins >> terraform
    terraform >> [centos, ubuntu]


with Diagram("Job2", show=False):

    with Cluster("Orchestration"):
        jenkins = Jenkins("Jenkins")

    with Cluster("Configurer"):
        ansible = Ansible("Ansible")

    client = Client("client")


    with Cluster("Ubuntu node"):
        maven = Custom(label="", icon_path="Apache_Maven_logo.svg.png")
        with Cluster("Tomcat"):
            tomcat = Tomcat("Tomcat")
            tomcat >> Edge() << client
            geo = Custom(label="Geocitizen", icon_path="./web.png")
            maven >> geo

    with Cluster("CentOS node"):
        postgresql = Postgresql("Postgresql")

    jenkins >> ansible
    ansible >> [maven, tomcat, postgresql]
    postgresql >> Edge() << geo

    terraform >> maven
