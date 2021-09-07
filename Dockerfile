FROM centos AS builder

RUN yum update -y && yum install httpd httpd-tools -y
RUN echo '<!DOCTYPE html><html><body><h1>Homework6!</h1></body></html>' > /usr/share/httpd/noindex/index.html

FROM centos7:hw

COPY --from=builder /usr/sbin/httpd /usr/sbin/
COPY --from=builder /var/lib/httpd /var/lib/
COPY --from=builder /etc/httpd /etc/
COPY --from=builder /usr/share/httpd /usr/share/
EXPOSE 80

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]



