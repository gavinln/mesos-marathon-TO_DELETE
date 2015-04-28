# Docker setup
class docker_setup {
    class { 'docker':
        version => '1.6.0',
        tcp_bind    => 'tcp://0.0.0.0:2375',
        socket_bind => 'unix:///var/run/docker.sock';
    }
}
