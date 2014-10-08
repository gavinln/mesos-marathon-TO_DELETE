#!/bin/bash

#sudo mesos-slave --master=192.168.33.10:5050
#sudo mesos-slave --master=zk://192.168.33.10:2181/mesos --log_dir=/var/log/mesos
#sudo mesos-slave --master=zk://localhost:2181/mesos --log_dir=/var/log/mesos

#sudo mesos-slave --master=zk://localhost:2181/mesos --log_dir=/var/log/mesos --isolation=cgroups/cpu,cgroups/mem

sudo mesos-slave --master=zk://localhost:2181/mesos --log_dir=/var/log/mesos --executor_registration_timeout=5mins -–containerizers=docker,mesos

