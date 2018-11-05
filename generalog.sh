#!/bin/bash

x=0
while true;do
	echo -e "evento $x\tserver: $(hostname)\ttime: $(date)\tservice: 1" >> /tmp/service1
	echo -e "evento $x\tserver: $(hostname)\ttime: $(date)\tservice: 2" >> /tmp/service2
	echo -e "evento $x\tserver: $(hostname)\ttime: $(date)\tservice: 3" >> /tmp/service3
x=$[$x+1]
sleep 2
done
