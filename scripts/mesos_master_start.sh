#!/bin/bash

#sudo mesos-master --ip=192.168.33.10 --work_dir=/var/lib/mesos
sudo mesos-master --work_dir=/var/lib/mesos --zk=zk://localhost:2181/mesos --quorum=1
#sudo mesos-master --ip=192.168.0.149 --work_dir=/var/lib/mesos --zk=zk://192.168.0.149:2181/mesos --quorum=1
