#!/bin/bash

#sudo mesos-slave --master=192.168.33.10:5050
#sudo mesos-slave --master=zk://192.168.33.10:2181/mesos --log_dir=/var/log/mesos
#sudo mesos-slave --master=zk://localhost:2181/mesos --log_dir=/var/log/mesos
#sudo mesos-slave --master=zk://localhost:2181/mesos --log_dir=/var/log/mesos --isolation=cgroups/cpu,cgroups/mem --credential=cred_slave.json

IP=$(ip -o -4 addr show eth1 | grep -o 'inet [0-9\.]\+' | cut -f2 -d' ')

sudo mesos-slave --ip=$IP \
    --containerizers=docker,mesos \
	--master=zk://localhost:2181/mesos \
	--log_dir=/var/log/mesos \
	--executor_registration_timeout=5mins \
	--resources="ports(*):[31000-41099]" \
    --credential=cred_slave.json

