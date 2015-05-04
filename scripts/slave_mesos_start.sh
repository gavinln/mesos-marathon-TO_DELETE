#!/bin/bash

#sudo mesos-slave --master=192.168.33.10:5050
#sudo mesos-slave --master=zk://192.168.33.10:2181/mesos --log_dir=/var/log/mesos
#sudo mesos-slave --master=zk://localhost:2181/mesos --log_dir=/var/log/mesos
#sudo mesos-slave --master=zk://localhost:2181/mesos --log_dir=/var/log/mesos --isolation=cgroups/cpu,cgroups/mem --credential=cred_slave.json

IP=$(ip -o -4 addr show eth1 | grep -o 'inet [0-9\.]\+' | cut -f2 -d' ')

# --master=zk://localhost:2181/mesos \
IP=0.0.0.0

sudo mesos-slave --ip=$IP \
	--hostname=$IP	\
    --containerizers=docker,mesos \
	--master=192.168.0.119:5050 \
	--log_dir=/var/log/mesos \
	--executor_registration_timeout=5mins \
	--resources="ports(*):[31000-41099]" \
    --credential=cred_slave.json

