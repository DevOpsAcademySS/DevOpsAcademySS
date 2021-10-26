#!/bin/bash

NEXUS_IP=$1
WEB_IP=$2
DOCKER_IP=$3
SONAR_IP=$4
IP_REGEXP="^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$"

echo "Inputs order: NEXUS_IP WEB_IP DOCKER_IP SONAR_IP"

if [[ "$NEXUS_IP" =~ $IP_REGEXP && "$WEB_IP" =~ $IP_REGEXP && "$DOCKER_IP" =~ $IP_REGEXP && "$SONAR_IP" =~ $IP_REGEXP ]]; then
	sed -i "s/{{ web_ip }}/$WEB_IP/" ./hosts.txt
	sed -i "s/{{ nexus_ip }}/$NEXUS_IP/" ./hosts.txt
	sed -i "s/{{ docker_ip }}/$DOCKER_IP/" ./hosts.txt
	sed -i "s/{{ sonar_ip }}/$SONAR_IP/" ./hosts.txt
fi
