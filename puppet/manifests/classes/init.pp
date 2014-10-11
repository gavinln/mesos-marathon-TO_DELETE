# Commands to run before all others in puppet.
class init {
    group { "puppet":
        ensure => "present",
    }
    case $operatingsystem {
        ubuntu: {
            exec { "apt-update":
                command => "sudo apt-get update",
            }
            Exec["apt-update"] -> Package <| |>
            # Provides "add-apt-repository" command, useful if you need
            # to install software from other apt repositories.
            $repokey = "E56151BF"
            $os_downcase = inline_template('<%= @operatingsystem.downcase %>')
            exec { "mesos_key":
                command => "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv  $repokey",
                unless  => "apt-key list | grep $repokey"
            }
            file { "mesosphere.list":
                ensure => file,
                path => "/etc/apt/sources.list.d/mesosphere.list",
                mode   => 0644,
                content => "deb http://repos.mesosphere.io/$os_downcase $lsbdistcodename main\n",
                replace => false,
                require => Exec["mesos_key"],
                notify => Exec["apt-update"]
            }
            package { "python-software-properties":
                ensure => present,
            }
            $misc_packages = ['git-core', 'tmux']
            package { $misc_packages:
                ensure => present,
            }
        }
    }
}
