Start Mesos master & slave
1. Change to the scripts directory
cd /vagrant/scripts

2. Start tmux with two panes
./tmux_start.sh

3. Make sure to set LIBPROCESS_IP (otherwise only one slave will be visible)
LIBPROCESS_IP=192.168.33.10

4. Export the LIBPROCESS_IP
export LIBPROCESS_IP=192.168.33.10

4. Start Mesos master
sudo ./master_mesos_start.sh

5. Switch to the other pane
Type Ctrl+b, o

6. Start Mesos slave (when starting slave of remove machine add --ip=)
sudo ./slave_mesos_start.sh

7. Detach from the Tmux session
Type Ctrl+b, d

8. To attach to the running session again
tmux attach-session -t mesos

9. Type Ctrl+c and exit to stop the mesos master and slave

Start Marathon
1. Set the ZooKeeper url by adding line zk://localhost:2181/mesos to the file
echo zk://localhost:2181/mesos | sudo tee /etc/mesos/zk

2. Start Marathon
sudo start marathon

3. Find the status of Marathon
sudo status marathon

To get the version of mesos type
1. mesos-master --version

To manage multiple ZooKeeper instances do the following
1. Check id of zookeeper
cat /var/lib/zookeeper/myid

1. Start ZooKeeper
sudo start zookeeper

2. Find status of ZooKeeper
sudo status zookeeper

3. Change to the ZooKeeper directory
cd /usr/share/zookeeper/bin

4. Test by connection to ZooKeeper (type quit to exit)
sudo ./zkCli.sh -server localhost:2181

5. If you have connected to the server the output will contain:
WatchedEvent state:SyncConnected type:None path:null

6. Type "ls /mesos" to get information about mesos setup

7. Type "quit" to exit

Setup the Flask app
1. Go to the Marathon dashboard
http://localhost:8080

2. Create a new app by clicking on the "New App" button

3. Enter the ID as flask-env

4. Enter the command all on one line (blank lines may cause problems)
/usr/bin/python /vagrant/python/flask_env/run.py

5. Click "Create"

6. Go the web page http://192.168.33.10:CUSTOM_PORT

7. To find the running process type
sudo netstat -nltp | grep CUSTOM_PORT

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

6. Enter the ID as ipython-app

7. Make sure to only allocate 512 MB memory

8. Enter the command all on one line (blank lines may cause problems)
/usr/local/bin/ipython notebook --no-browser --ip=0.0.0.0 --port=$PORT

9. Click "Create"

10. Go the web page http://192.168.33.10:CUSTOM_PORT

To use the REST api for Marathon
1. Change to the examples directory
cd /vagrant/examples

2. Get all Marathon tasks
curl -X GET -H "Content-Type: application/json" localhost:8080/v2/tasks | python -m json.tool

3. Create a task using the Marathon REST api
curl -i -H 'Content-Type: application/json' -d @PythonSimpleHTTPServer.json localhost:8080/v2/apps

4. Create a Docker instance using the Marathon REST api
curl -X POST -H "Content-Type: application/json" http://localhost:8080/v2/apps -d@Docker.json

5. Create a Tomcat Docker instance using the Marathon REST api
curl -X POST -H "Content-Type: application/json" http://localhost:8080/v2/apps -d@tomcat.json

Enable Docker without sudo
1. Login as the user (vagrant)
vagrant ssh

2. Add the user to the docker group
sudo gpasswd -a ${USER} docker

3. Logout and repeat step 1
exit


