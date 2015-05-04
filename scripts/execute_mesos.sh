#!/bin/bash

IP=$(ip -o -4 addr show eth1 | grep -o 'inet [0-9\.]\+' | cut -f2 -d' ')

IP=10.0.0.100

sudo mesos execute --master=$IP:5050 --command="ls -lrt" --name=ls
#sudo mesos execute --master=192.168.0.106:5050 --docker_image=busybox:latest --command="ls -lrt" --name=docker_ls
