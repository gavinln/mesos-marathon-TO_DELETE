# mesos-marathon

Creates a Vagrant Virtualbox VM that installs Apache Mesos and Marathon

* Source code - [Github][1]
* Author - Gavin Noronha - <gavinln@hotmail.com>

[1]: https://github.com/gavinln/mesos-marathon.git

## About
-----

This project provides a [Ubuntu (14.04)][2] [Vagrant][3] Virtual Machine (VM)
with [Apache Mesos][4] and [Marathon][5] setup. It demonstrates running a
Python [Flask][6] and [IPython notebook][7] application. In addition
[Zookeeper][8] is setup to manage the cluster.

There are [Puppet][9] scripts that automatically install the software when
the VM is started.

[2]: http://releases.ubuntu.com/14.04/
[3]: http://www.vagrantup.com/
[4]: http://mesos.apache.org/
[5]: https://mesosphere.github.io/marathon/
[6]: http://flask.pocoo.org/
[7]: http://ipython.org/notebook.html
[8]: http://zookeeper.apache.org/
[9]: http://puppetlabs.com/

## Starting the virtual machine

1. To start the virtual machine(VM) type
    ```
    vagrant up
    ```
2. Connect to the VM
    ```
    vagrant ssh
    ```
3. If you see the "Z Shell configuration function for new users" enter 2

## Starting servers

### Starting ZooKeeper

1. Check whether ZooKeeper is running
    ```
    sudo status zookeeper
    ```
2. Connect to ZooKeeper (If successful you will see the word *CONNECTED*
    ```bash
    sudo /usr/share/zookeeper/bin/zkCli.sh -server localhost:2181
    ```
3. Type `quit` to exit the *zkCli* application

### Starting Mesos

1. Change to the scripts directory
    ```bash
    cd /vagrant/scripts
    ```
2. Start tmux
    ```bash
    ./tmux_start.sh
    ```
3. Start mesos-master
    ```
    sudo ./master_mesos_start.sh
    ```
4. Switch to the other pane. Type Ctrl+b, o

5. Start mesos-slave
    ```
    sudo ./slave_mesos_start.sh
    ```
6. Detach from the Tmux session. Type Ctrl+b, d

7. To attach to the running session again
    ```bash
    tmux attach-session -t mesos
    ```
8. Type Ctrl+c and exit to stop the mesos master and slave

### Check Mesos servers

1. Access the Mesos master in the browser at the URL http://localhost:5050/

2. Access the Mesos slave in the browser at the URL http://localhost:5051/

3. If you see a blank page without errors the slave is correctly started

## Start Marathon

1. sudo start marathon

2. sudo status marathon

3. Access Marathon in the browser at the URL. http://localhost:8080/

## Setup the Python Flask application

1. Go to the Marathon dashboard http://localhost:8080

2. Create a new app by clicking on the "New App" button

3. Enter the ID as flask-env

4. Enter the command all on one line (blank lines may cause problems)
    ```
    /usr/bin/python /vagrant/python/flask_env/run.py
    ```

5. Click "Create"

6. Access the Flask application http://192.168.33.10:PORT

## Setup the IPython application

1. Go to the Marathon dashboard http://localhost:8080

2. Create a new app by clicking on the "New App" button

3. Enter the ID as ipython

4. Enter the command all on one line (blank lines may cause problems)
    ```
    /usr/local/bin/ipython notebook --no-browser --ip=0.0.0.0 --port=$PORT
    ```

5. Click "Create"

Requirements
------------

The following software is needed to get the software from github and run
Vagrant to set up the Python development environment. The Git environment
also provides an [SSH  client][10] for Windows.

* [Oracle VM VirtualBox][11]
* [Vagrant][12]
* [Git][13]

[10]: http://en.wikipedia.org/wiki/Secure_Shell
[11]: https://www.virtualbox.org/
[12]: http://vagrantup.com/
[13]: http://git-scm.com/
