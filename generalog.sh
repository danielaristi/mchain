#!/bin/bash

x=0
while true;do
	echo "evento $x $(date) service 1" >> /tmp/service1
	echo "evento $x $(date) service 2" >> /tmp/service2
	echo "evento $x $(date) service 3" >> /tmp/service3
x=$[$x+1]
sleep 2
done
