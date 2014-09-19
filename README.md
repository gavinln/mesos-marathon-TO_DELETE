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

3. Start the server
    ```bash
    sudo start marathon
    ```

4. Open the notebook in the browser at the URL.
    ```
    http://localhost:8080/
    ```

## Checking servers

### Checking ZooKeeper

1. Check whether ZooKeeper is running
    ```
    sudo status zookeeper
    ```

2. Connect to ZooKeeper (If successful you will see the word *CONNECTED*
    ```bash
    sudo /usr/share/zookeeper/bin/zkCli.sh -server localhost:2181
    ```

3. Type `quit` to exit the *zkCli* application

### Checking Mesos

1. Check whether Mesos-master is running
    ```
    sudo status zookeeper
    ```

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
