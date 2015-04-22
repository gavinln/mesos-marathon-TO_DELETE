#!/bin/bash

#sudo mesos-master --ip=192.168.33.10 --work_dir=/var/lib/mesos
#sudo mesos-master --ip=192.168.0.149 --work_dir=/var/lib/mesos --zk=zk://192.168.0.149:2181/mesos --quorum=1

IP=$(ip -o -4 addr show eth1 | grep -o 'inet [0-9\.]\+' | cut -f2 -d' ')
sudo mesos-master --ip=$IP --work_dir=/var/lib/mesos --zk=zk://localhost:2181/mesos --log_dir=/var/log/mesos --quorum=1 --credentials=cred_master.json
