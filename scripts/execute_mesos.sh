#!/bin/bash

#mesos execute --command="ls -lrt"  --master=192.168.33.10:5050 --name=ls
mesos execute --command="pwd"  --master=192.168.33.10:5050 --name=pwd
