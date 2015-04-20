#!/bin/bash

#sudo mesos-master --ip=192.168.33.10 --work_dir=/var/lib/mesos
#sudo mesos-master --ip=192.168.0.149 --work_dir=/var/lib/mesos --zk=zk://192.168.0.149:2181/mesos --quorum=1
sudo mesos-master --ip=192.168.33.10 --work_dir=/var/lib/mesos --zk=zk://localhost:2181/mesos --log_dir=/var/log/mesos --quorum=1 --credentials=cred_master.json
