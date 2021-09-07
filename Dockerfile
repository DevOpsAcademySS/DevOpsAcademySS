FROM centos

RUN yum update -y && yum install httpd httpd-tools -y
RUN echo '<!DOCTYPE html><html><body><h1>Homework6!</h1></body></html>' > /usr/share/httpd/noindex/index.html

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]



