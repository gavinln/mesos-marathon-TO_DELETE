# install java
class java_setup {
    class { 'java':
        distribution => "jdk";
    }
}

