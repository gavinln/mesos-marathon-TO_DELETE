# repo setup
#
class repo_setup {
    $repokey = "E56151BF"
    $os_downcase = inline_template('<%= @operatingsystem.downcase %>')
    exec { "mesos_key":
        command => "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv  $repokey",
        unless  => "apt-key list | grep $repokey"
    } 
    exec { "apt_update_repo":
        command => "sudo apt-get update"
    }
    file { "mesosphere.list":
        ensure => file,
        path => "/etc/apt/sources.list.d/mesosphere.list",
        mode   => 0644,
        content => "deb http://repos.mesosphere.io/$os_downcase $lsbdistcodename main\n",
        replace => false,
        require => Exec["mesos_key"],
        notify  => Exec["apt_update_repo"],
    }

}
