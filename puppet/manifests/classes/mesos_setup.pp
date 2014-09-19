# Mesos setup
class mesos_setup {
    class { 'mesos':
        ensure => present
    }
    #class{ 'mesos::master':
    #    master_port => 5050,
    #    work_dir => '/var/lib/mesos',
    #    options => {
    #        log_dir => '/var/log/mesos',
    #    }
    #}
    #class{ 'mesos::slave':
    #    require => Class['mesos::master'],
    #    zookeeper => 'zk://localhost:2181/mesos',
    #}
}
