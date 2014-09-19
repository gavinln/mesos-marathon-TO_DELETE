#!/bin/bash

#sudo mesos-slave --master=192.168.33.10:5050
#sudo mesos-slave --master=zk://192.168.0.149:2181/mesos --hostname=gavinnb
sudo mesos-slave --master=zk://localhost:2181/mesos
#sudo mesos-slave --master=zk://localhost:2181/mesos --isolation=cgroups/cpu,cgroups/mem
