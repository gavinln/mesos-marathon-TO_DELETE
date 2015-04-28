# setup jenkins
class jenkins_setup {
    include jenkins
    jenkins::plugin { "mesos" :
    }
}
