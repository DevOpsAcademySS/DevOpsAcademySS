FROM tomcat:9.0.53-jre8-openjdk-slim-buster

COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY context.xml /usr/local/tomcat/webapps/host-manager/META-INF/
COPY citizen.war /usr/local/tomcat/webapps/

RUN apt-get update && apt-get install -y supervisor 
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY tomcat.conf /etc/supervisor/conf.d/tomcat.conf

CMD ["/usr/bin/supervisord"]