from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import EC2
from diagrams.onprem.ci import Jenkins
from diagrams.onprem.iac import Terraform
from diagrams.onprem.client import User


with Diagram("Diagrams as a Code 1", show=True, direction="LR"):

    devops = User('DevOps')

    with Cluster('AWS'):

        with Cluster('Cluster'):

            with Cluster('Ubuntu node'):
                ubuntu = EC2('Ubuntu')

            with Cluster('Amazon node'):
                amazon = EC2('Amazon')
            amazon - Edge(style="dashed") - ubuntu

        with Cluster('Master'):
            jenkins = Jenkins('Jenkins')

            with Cluster('Agents'):
                terraform = Terraform('Terraform')

            jenkins >> Edge() << terraform

    devops >> jenkins
    terraform >> [ubuntu, amazon]
