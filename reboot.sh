#!/bin/bash

#
# Router Settings
#
ROUTER_IP="10.0.0.1"
ROUTER_USER="admin"
ROUTER_PWD="admin"

#
# Confirmation
#
if [ "$1" != "-f" ]
then
	echo
	echo "This will restart your D-Link DRW-116 Router"
	read -p "Are you sure you want to continue? (y/n) " -e -i y CONFIRM
	
	# Not y, so bye!
	if [ "$CONFIRM" != "y" ]
	then
		echo "Script stopped."
		exit 0
	fi
fi

#
# Submit (GET) login form with correct referal
#
	curl --referer "http://$ROUETER_IP/uir/401.htm?Surl=uir//ram/www/rebo.htm" \
	"http://$ROUTER_IP/log/in?un=$ROUTER_USER&pw=$ROUTER_PWD&rd=%2Fuir%2F%2Fram%2Fwww%2Frebo.htm&rd2=%2Fuir%2Fwanst.htm&Nrd=1"

#
# GET Actual reboot page
#
	curl "http://$ROUTER_IP/uir//ram/www/rebo.htm?Nrc=0&Nrd=1"

