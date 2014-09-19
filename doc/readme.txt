Start Mesos master & slave
1. Change to the scripts directory
cd /vagrant/scripts

2. Start tmux with two panes
./mesos_tmux.sh

3. Make sure to set LIBPROCESS_IP (otherwise only one slave will be visible)
LIBPROCESS_IP=192.168.33.10
LIBPROCESS_IP=192.168.0.149

4. Export the LIBPROCESS_IP
export LIBPROCESS_IP

4. Start Mesos master
./mesos_master_start.sh

5. Switch to the other pane
Type Ctrl+b, o

6. Start Mesos slave (when starting slave of remove machine add --ip=)
sudo ./mesos_slave_start.sh

7. Detach from the Tmux session
Type Ctrl+b, d

8. To attach to the running session again
tmux attach-session -t mesos

9. Type Ctrl+c and exit to stop the mesos master and slave

Use Jenkins
1. Open a web browser to Jenkins at http://localhost:8080/

2. Click on "Manage Jenkins", "Configure System"

3. Click "Add a new cloud", "Mesos Cloud"

4. For "Mesos native library path" enter:
/usr/local/lib/libmesos.so

5. For "Mesos Master" enter:
192.168.33.10:5050

6. Click on "Test Connection" and make sure it says "Connected to Mesos successfully"

7. Click "Save"

To get the version of mesos type
1. mesos-master --version

To install Marathon
sudo apt-get -y install marathon
wget http://downloads.mesosphere.io/marathon/marathon-0.6.1/marathon-0.6.1.tgz

To manage ZooKeeper do the following
1. Check id of zookeeper
cat /var/lib/zookeeper/myid

1. Start ZooKeeper (make sure that /etc/mesos/zk has zk://localhost:2181/mesos)
sudo start zookeeper

2. Find status of ZooKeeper
sudo status zookeeper

3. Change to teh ZooKeeper directory
cd /usr/share/zookeeper/bin

4. Test by connection to ZooKeeper (type quit to exit)
sudo ./zkCli.sh -server localhost:2181

5. If you have connected to the server the output will contain:
WatchedEvent state:SyncConnected type:None path:null

To manage Marathon
1. Set the ZooKeeper url by adding line zk://localhost:2181/mesos to the file
sudo vi /etc/mesos/zk

2. Start Marathon
sudo start marathon

./start --master zk://192.168.0.149:2181/mesos --zk zk://192.168.0.149:2181/marathon

3. Find the status of Marathon
sudo status marathon

Setup the Flask app
1. Go to the Marathon dashboard
http://localhost:8080

2. Create a new app by clicking on the "New App" button

3. Enter the ID as flask-env

4. Enter the command all on one line (blank lines may cause problems)
/usr/bin/python /vagrant/python/flask_env/run.py

5. Click "Create"

Setup IPython
1. Install pyzmq
sudo apt-get install python-zmq

2. Install tornado
sudo pip install tornado

3. Install ipython
sudo pip install ipython

4. Go to the Marathon dashboard
http://localhost:8080

5. Create a new app by clicking on the "New App" button

6. Enter the ID as ipython1

7. Enter the command all on one line (blank lines may cause problems)
/usr/local/bin/ipython notebook --no-browser --ip=0.0.0.0 --port=$PORT

8. Click "Create"

Setup haproxy
See https://mesosphere.github.io/marathon/docs/service-discovery-load-balancing.html
1. Install haproxy
sudo apt-get install haproxy

Get script to setup haproxy.cfg
https://raw.githubusercontent.com/mesosphere/marathon/master/bin/haproxy-marathon-bridge

./haproxy-marathon-bridge 192.168.33.10:8080 > haproxy.cfg

haproxy -f haproxy.cfg -p haproxy.pid -sf $(cat haproxy.pid)
