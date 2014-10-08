# install python
class python_setup {
    case $operatingsystem {
        ubuntu: {
            package { "python-pip":
                ensure => installed
            }
            package { 'python-zmq':
                ensure => installed
            }
            package { 'flask':
                ensure => installed,
                provider => pip,
                require => Package['python-pip']
            }
            #package { 'mesos.cli':
            #    ensure => installed,
            #    provider => pip,
            #    require => Package['python-pip']
            #}
            package { 'tornado':
                ensure => installed,
                provider => pip,
                require => Package['python-pip']
            }
            package { 'ipython':
                ensure => installed,
                provider => pip,
                require => Package['python-pip']
            }
        }
    }
}
