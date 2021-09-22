#!/bin/sh

WEB_IP=$1
DB_IP=$2
IP_REGEXP="^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$"
if [[ "$WEB_IP" =~ $IP_REGEXP && "$DB_IP" =~ $IP_REGEXP ]]; then
	sed -i "s/{{ web_ip }}/$WEB_IP/" ./inventory.txt
	sed -i "s/{{ db_ip }}/$DB_IP/" ./inventory.txt
	exit 0
fi

exit 1