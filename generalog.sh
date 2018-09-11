#!/bin/bash

x=0
while true;do
	echo "evento $x $(date)" >> /tmp/dart
x=$[$x+1]
sleep 2
done
