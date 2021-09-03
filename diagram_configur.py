from diagrams import Cluster, Diagram, Edge
from diagrams.generic.os import Ubuntu, Centos
from diagrams.aws.general import Users
from diagrams.onprem.iac import Terraform, Ansible
from diagrams.onprem.ci import Jenkins
from diagrams.oci.connectivity import DNS
from diagrams.onprem.database import Postgresql
from diagrams.onprem.network import Tomcat
from diagrams.programming.language import Nodejs
from diagrams.custom import Custom

with Diagram("Geocitizen Configuration", show=True):
    dns = DNS("Route 53")
    Jnkns = Jenkins("Jenkins")
    Trrfrm = Terraform("")
    Ansbl = Ansible("Ansible")
    with Cluster("AWS"):
        with Cluster("Database"):
            Ubnt = Ubuntu("Ubuntu")
            Psql = Postgresql("PostgreSQL")
            Ubnt - Psql
        with Cluster("Server"):
            Maven = Custom(label="Maven", icon_path="mvn.png")
            Mvn = Maven 
            Geoc = Custom(label="Geocitizen", icon_path="web.png")
            Gctzn = Geoc
            Cnts = Centos("")
            Tmct = Tomcat("Tomcat")
            Cnts - Tmct
            Ndjs = Nodejs("NodeJS")
            Cnts - Ndjs
            Cnts - Mvn
            Ndjs >> Gctzn
            Mvn >> Gctzn
            Gctzn - Tmct
        aws = [Ubnt,Cnts]
        Gctzn >> Edge() << Psql
    Trrfrm >> Edge(label="job done") >> Jnkns >> Ansbl >> aws
    Tmct >> dns >> Edge() << Users("Users")
