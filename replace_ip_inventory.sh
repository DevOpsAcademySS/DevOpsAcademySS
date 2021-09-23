#!/bin/sh

WEB_IP=$1
DB_IP=$2

sed -i "s/{{ web_ip }}/$WEB_IP/" "./inventory.txt"
sed -i "s/{{ db_ip }}/$DB_IP/" "./inventory.txt"

exit 1