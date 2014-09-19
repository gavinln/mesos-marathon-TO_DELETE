#
# puppet magic for dev boxes
#
import "classes/*.pp"

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class dev {
    class {
        init:;
        repo_setup: require => Class[init];
        #python_setup: require => Class[init];
        ohmyzsh_setup: require => Class[init];
        mesos_setup: require => Class[repo_setup];
    }
}

include dev

