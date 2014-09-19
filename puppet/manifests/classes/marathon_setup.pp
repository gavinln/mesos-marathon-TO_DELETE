# Marathon setup
class marathon_setup {
    package { "marathon":
        ensure => installed,
        require => Class['mesos_setup']
    }
}
