from diagrams import Diagram, Cluster, Edge
from diagrams.custom import Custom
from diagrams.onprem.vcs import Github
from diagrams.programming.language import Java
from diagrams.onprem.ci import Jenkins
from diagrams.onprem.iac import Terraform
from diagrams.aws.devtools import Codebuild
from diagrams.aws.security import Artifact

with Diagram("Diagrams as a Code 2", show=True, direction="LR"):

    terraform = Terraform('Terraform')

    with Cluster('AWS'):
        with Cluster('Cluster', direction='LR'):
            with Cluster('Amazon node', 'TB'):

                amazon = Custom(
                    'Amazon Linux', './Data visualisation/icons/amazon-linux.png')

                with Cluster('Aplications', 'TB'):
                    maven = Custom(
                        'Maven 3.6.3', './Data visualisation/icons/Apache_Maven_logo.svg.png')
                    nodenpm = Custom(
                        'Nodejs+Npm', './Data visualisation/icons/nodejs-npm.png')
                    geocitizen = Custom(
                        'geocitizen.war', './Data visualisation/icons/war.png')
                    geo_artifact = Artifact('Geocitizen Artifact')
                    github = Github('Geocitizen')
                    java = Java('Java 1.8')
                    github - java - nodenpm - maven - geocitizen
                    geocitizen - geo_artifact

        with Cluster('Master'):
            jenkins = Jenkins('Jenkins')

            with Cluster('Agent'):
                geo_build = Codebuild('Build Geocitizen')
                jenkins >> Edge() << geo_build
                geo_build >> amazon

    terraform >> jenkins
