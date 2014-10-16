class javascript {
    class { 'nodejs':
        version => 'stable'
    }
    package { 'bower':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
    package { 'grunt-cli':
        provider => npm,
        ensure => installed,
        require => Class['nodejs']
    }
#    package { 'yo':
#        provider => npm,
#        ensure => installed,
#        require => Class['nodejs']
#    }
#    package { 'generator-angular':
#        provider => npm,
#        ensure => installed,
#        require => Package['yo']
#    }
}
