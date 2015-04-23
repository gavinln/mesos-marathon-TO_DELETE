#!/bin/bash

#sudo mesos execute --master=192.168.0.106:5050 --command="ls -lrt" --name=ls
sudo mesos execute --master=192.168.0.106:5050 --docker_image=busybox:latest --command="ls -lrt" --name=docker_ls
