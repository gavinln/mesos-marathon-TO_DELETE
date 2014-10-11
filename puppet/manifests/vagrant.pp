#
# puppet magic for dev boxes
#
import "classes/*.pp"

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class {
    init: ;
    mesos_setup: require => Class[init];
    docker:;
    python_setup:;
    ohmyzsh_setup:;
    marathon_setup: require => Class[mesos_setup];
}


