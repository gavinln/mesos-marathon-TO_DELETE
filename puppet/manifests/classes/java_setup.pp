# install java
class java_setup {
    class { 'java':
        distribution => "jdk";
    }
    class { 'tomcat':
        require => Package["java"]
    }
}

