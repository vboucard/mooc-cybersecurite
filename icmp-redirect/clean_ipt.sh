#!/bin/bash

rules=`sudo iptables -t nat -S POSTROUTING | grep MASQ|grep -v docker` 
while read -r rule
do
	echo $rule	
	command="iptables -t nat -D"`echo $rule|cut -c 4-`
	echo $command
	sudo $command
done  < <(echo "$rules")

