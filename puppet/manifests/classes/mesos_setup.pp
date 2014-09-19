# Mesos setup
class mesos_setup {
    class { 'mesos':
        ensure => present,
        zookeeper => 'zk://localhost:2181/mesos',
    }
    class{ 'mesos::master':
        master_port => 5050,
        work_dir => '/var/lib/mesos',
        require => Class['mesos'],
        options => {
            log_dir => '/var/log/mesos',
        }
    }
    class{ 'mesos::slave':
        require => Class['mesos::master'],
        #master => 'zk://127.0.0.1:2181/mesos',
        master => 'localhost:5050',
    }
}
