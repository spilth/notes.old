# Apache Tomcat

http://tomcat.apache.org/

	$ tar -zxvf apache-tomcat-6.0.32.tar.gz
	$ cd cd apache-tomcat-6.0.32

## Enable Tomcat Manager

Edit `conf/tomcat-users.xml` and add the following:

	<?xml version='1.0' encoding='utf-8'?>
	<tomcat-users>
	  <user username="admin" password="admin" roles="manager, manager-gui" />
	</tomcat-users>

## Start Tomcat

	$ ./bin/startup.sh 

Then visit `http://localhost:8080/`. The manager can be reached at `http://localhost:8080/manager/html`.

## Enabling JMX

Add the following to `bin/startup.sh`:

	export CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9042 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"
