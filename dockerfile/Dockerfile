#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM openjdk:11-jre-slim-bullseye

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# let "Tomcat Native" live somewhere isolated
ENV TOMCAT_NATIVE_LIBDIR $CATALINA_HOME/native-jni-lib
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$TOMCAT_NATIVE_LIBDIR

# see https://www.apache.org/dist/tomcat/tomcat-9/KEYS
# see also "versions.sh" (https://github.com/docker-library/tomcat/blob/master/versions.sh)
ENV GPG_KEYS 48F8E69F6390C9F25CFEDCD268248959359E722B A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 DCFD35E0BF8CA7344752DE8B6FB21E8933C60243

ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.54
ENV TOMCAT_SHA512 83430f24d42186ce2ff51eeef2f7a5517048f37d9050c45cac1e3dba8926d61a1f7f5aba122a34a11ac1dbdd3c1f6d98671841047df139394d43751263de57c3

COPY --from=tomcat:9.0.54-jdk11-openjdk-slim-bullseye $CATALINA_HOME $CATALINA_HOME
RUN set -eux; \
	apt-get update; \
	xargs -rt apt-get install -y --no-install-recommends < "$TOMCAT_NATIVE_LIBDIR/.dependencies.txt"; \
	rm -rf /var/lib/apt/lists/*

# verify Tomcat Native is working properly
RUN set -eux; \
	nativeLines="$(catalina.sh configtest 2>&1)"; \
	nativeLines="$(echo "$nativeLines" | grep 'Apache Tomcat Native')"; \
	nativeLines="$(echo "$nativeLines" | sort -u)"; \
	if ! echo "$nativeLines" | grep -E 'INFO: Loaded( APR based)? Apache Tomcat Native library' >&2; then \
		echo >&2 "$nativeLines"; \
		exit 1; \
	fi

# configure Tomcat for managing, copy configured files from context folder
WORKDIR /usr/local/tomcat/conf/
COPY ./tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
WORKDIR /tmp/
COPY ./context.xml /tmp/context.xml

# backup webapps
RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
RUN cp /tmp/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

# copy war file with geocitizen to webapps directory
WORKDIR /usr/local/tomcat/webapps/
COPY ./geocitizen.war /usr/local/tomcat/webapps/

# install python3, pip & supervisor
RUN apt update && apt install -y python3 python3-pip && pip install supervisor 
# make folders
RUN mkdir -p /etc/supervisor && mkdir -p /etc/supervisor/conf.d && mkdir -p /var/log/supervisor
# make config
RUN echo_supervisord_conf > /etc/supervisor/supervisord.conf
# insert data in config
RUN echo [include] >> /etc/supervisor/supervisord.conf && echo files = /etc/supervisor/conf.d/*.conf >> /etc/supervisor/supervisord.conf

COPY tomcat_svd.conf /etc/supervisor/conf.d/tomcat_svd.conf

EXPOSE 8080
EXPOSE 9001 

CMD ["/usr/local/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]