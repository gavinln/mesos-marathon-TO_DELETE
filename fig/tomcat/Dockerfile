FROM tomcat:6.0.43-jre7

MAINTAINER Gavin Noronha <gavinln@hotmail.com>

WORKDIR /usr/local/tomcat

# RUN cp $CATALINA_HOME/webapps/docs/appdev/sample/sample.war $CATALINA_HOME/webapps
ADD simple.war /usr/local/tomcat/webapps/
RUN ls /usr/local/tomcat/webapps

CMD ["bin/catalina.sh", "run"]
