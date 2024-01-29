FROM amazonlinux
RUN yum install java tar gzip wget -y
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz .
RUN tar -zxvf apache-tomcat-9.0.83.tar.gz
RUN sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.83/conf/tomcat-users.xml
Files
Go to file
t
src
Dockerfile
Jenkinsfile
pom.xml
Editing Dockerfile in netflix-webapp-code
Breadcrumbsnetflix-webapp-code
/
Dockerfile
in
master


RUN sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.83/conf/tomcat-users.xml
RUN sed -i '58  a\<user username="tomcat" password="tomcat" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.83/conf/tomcat-users.xml
RUN sed -i '59  a\</tomcat-users>' apache-tomcat-9.0.83/conf/tomcat-users.xml
RUN sed -i '56d' apache-tomcat-9.0.83/conf/tomcat-users.xml
RUN sed -i '21d' apache-tomcat-9.0.83/webapps/manager/META-INF/context.xml
RUN sed -i '22d'  apache-tomcat-9.0.83/webapps/manager/META-INF/context.xml
RUN mv ./apache-tomcat-9.0.83 ./usr/local/
CMD ["./usr/local/apache-tomcat-9.0.83/bin/catalina.sh", "run"]
    
