#!/bin/bash

NEXUS_IP=$1
NEXUS_USR=$2
NEXUS_PASS=$3
DOCKER_PORT="8085"
IP_REGEXP="^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$"

if [[ "$NEXUS_IP" =~ $IP_REGEXP ]]; then
	sed -i "s/http:\/\/.*:$DOCKER_PORT/http:\/\/$NEXUS_IP:$DOCKER_PORT/" ./roles/DockerOnUbuntu/files/daemon.json

	sed -i "s/nexus_url:.*/nexus_url: $NEXUS_IP:$DOCKER_PORT/" ./roles/ContainerizeGeo/vars/main.yaml
	sed -i "s/nexus_usr:.*/nexus_usr: $NEXUS_USR/" ./roles/ContainerizeGeo/vars/main.yaml
	sed -i "s/nexus_pass:.*/nexus_pass: $NEXUS_PASS/" ./roles/ContainerizeGeo/vars/main.yaml

	sed -i "s/nexus_url:.*/nexus_url: $NEXUS_IP:$DOCKER_PORT/" ./roles/GeocitizenOnUbuntu/vars/main.yaml
	sed -i "s/nexus_usr:.*/nexus_usr: $NEXUS_USR/" ./roles/GeocitizenOnUbuntu/vars/main.yaml
	sed -i "s/nexus_pass:.*/nexus_pass: $NEXUS_PASS/" ./roles/GeocitizenOnUbuntu/vars/main.yaml
fi

exit 1