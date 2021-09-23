#!/bin/sh

WEB_IP=$1
DB_IP=$2
IP_REGEXP="^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$"

if  [[ ! "$DB_IP" =~ $IP_REGEXP || ! "$WEB_IP" =~ $IP_REGEXP ]]; # check if IP and PATH valid
then
    printf "Set the Servers IPs(0.0.0.0):"
    printf "\n\n\tExample: $0 yor_WEB_IP yor_DB_IP\n"
    exit 1
fi

sed -i "s/{{ web_ip }}/$WEB_IP/" "./inventory.txt"
sed -i "s/{{ db_ip }}/$DB_IP/" "./inventory.txt"

exit 1