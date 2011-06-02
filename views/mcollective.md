# MCollective

> The Marionette Collective AKA MCollective is a framework to build server orchestration or parallel job execution systems.

This configuration consists of:

* A Middleware Server (ActiveMQ)
* Multiple MCollective Clients

## Prerequisites

These instructions assume you've already installed the following on each machine:

* Java
* Ruby
* RubyGems
* Stomp RubyGem

## Install

### Install Apache ActiveMQ

Download from [ActiveMQ Latest Release](http://activemq.apache.org/download.html)

	$ tar -zxvf apache-activemq-5.5.0-bin.tar.gz
	$ cd apache-activemq
	$ bin/activemq start
	
### Install MCollective

* mcollective = install on 
* mcollective-common
* mcollective-client

To install MCollective:

	$ wget http://www.puppetlabs.com/downloads/mcollective/mcollective-1.2.0-5.el5.noarch.rpm
	$ wget http://www.puppetlabs.com/downloads/mcollective/mcollective-client-1.2.0-5.el5.noarch.rpm
	$ wget http://www.puppetlabs.com/downloads/mcollective/mcollective-common-1.2.0-5.el5.noarch.rpm
	$ sudo yum localinstall mcollective-common-1.2.0-5.el5.noarch.rpm --nogpgcheck
	$ sudo yum localinstall mcollective-1.2.0-5.el5.noarch.rpm --nogpgcheck
	$ sudo yum localinstall mcollective-client-1.2.0-5.el5.noarch.rpm --nogpgcheck
	$ sudo /etc/init.d/mcollective restart

## Configure

### Configure ActiveMQ

Edit `ACTIVEMQ_HOME/conf/activemq.xml`

	<?xml version="1.0"?>
	<beans xmlns="http://www.springframework.org/schema/beans" xmlns:amq="http://activemq.apache.org/schema/core" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.0.xsd   http://activemq.apache.org/schema/core http://activemq.apache.org/schema/core/activemq-core.xsd">
		<bean class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
			<property name="locations">
				<value>file:${activemq.base}/conf/credentials.properties</value>
			</property>
		</bean>
		<broker xmlns="http://activemq.apache.org/schema/core" brokerName="localhost" useJmx="true">
			<managementContext>
				<managementContext createConnector="false"/>
			</managementContext>
			<plugins>
				<statisticsBrokerPlugin/>
				<simpleAuthenticationPlugin>
					<users>
						<authenticationUser username="mcollective" password="marionette" groups="mcollective,everyone"/>
						<authenticationUser username="admin" password="secret" groups="mcollective,admin,everyone"/>
					</users>
				</simpleAuthenticationPlugin>
				<authorizationPlugin>
					<map>
						<authorizationMap>
							<authorizationEntries>
								<authorizationEntry queue=">" write="admins" read="admins" admin="admins"/>
								<authorizationEntry topic=">" write="admins" read="admins" admin="admins"/>
								<authorizationEntry topic="mcollective.>" write="mcollective" read="mcollective" admin="mcollective"/>
								<authorizationEntry topic="mcollective.>" write="mcollective" read="mcollective" admin="mcollective"/>
								<authorizationEntry topic="ActiveMQ.Advisory.>" read="everyone" write="everyone" admin="everyone"/>
							</authorizationEntries>
						</authorizationMap>
					</map>
				</authorizationPlugin>
			</plugins>
			<systemUsage>
				<systemUsage>
					<memoryUsage>
						<memoryUsage limit="20 mb"/>
					</memoryUsage>
					<storeUsage>
						<storeUsage limit="1 gb" name="foo"/>
					</storeUsage>
					<tempUsage>
						<tempUsage limit="100 mb"/>
					</tempUsage>
				</systemUsage>
			</systemUsage>
			<transportConnectors>
				<transportConnector name="openwire" uri="tcp://0.0.0.0:6166"/>
				<transportConnector name="stomp" uri="stomp://0.0.0.0:6163"/>
			</transportConnectors>
		</broker>
		<import resource="jetty.xml"/>
	</beans>

### Configure MCollective

Edit `/etc/mcollective/client.cfg`

	# main config
	topicprefix = /topic/
	libdir = /usr/libexec/mcollective
	logfile = /dev/null
	loglevel = error

	# connector plugin config
	connector = stomp
	plugin.stomp.host = stomp.example.net
	plugin.stomp.port = 6163
	plugin.stomp.user = mcollective
	plugin.stomp.password = marionette

	# security plugin config
	securityprovider = psk
	plugin.psk = abcdefghj
	
Edit `/etc/mcollective/server.cfg`

	# main config
	topicprefix = /topic/
	libdir = /usr/libexec/mcollective
	logfile = /var/log/mcollective.log
	daemonize = 1
	loglevel = info

	# connector plugin config
	connector = stomp
	plugin.stomp.host = stomp.example.net
	plugin.stomp.port = 6163
	plugin.stomp.user = mcollective
	plugin.stomp.password = marionette

	# facts
	factsource = yaml
	plugin.yaml = /etc/mcollective/facts.yaml

	# security plugin config
	securityprovider = psk
	plugin.psk = abcdefghj

### Create Fact

Edit `/etc/mcollective/facts.yaml`

	---
    location: devel
    country: uk

## Start Services

### Start ActiveMQ

	$ /etc/init.d/activemq start

Or

	$ cd ACTIVEMQ_HOME
	$ bin/activemq start
	
### Start MCollective?

	$ /etc/init.d/mcollective restart

## Test

### Test Connectivity

	$ mco ping

## Security
 
## mco

* inventory = General reporting tool for nodes, collectives and subcollectives
* find = Find hosts matching criteria
* rpc = Generic RPC agent client application
* facts = Reports on usage for a specific fact
* controller = Control the mcollective daemon
* ping = Ping all nodes

## Resources

* [PuppetLabs: Getting Start](http://docs.puppetlabs.com/mcollective/reference/basic/gettingstarted_redhat.html)
* [PuppetLabs: Configuration](http://docs.puppetlabs.com/mcollective/reference/basic/configuration.html)
* [PuppetLabs: ActiveMQ Security](http://docs.puppetlabs.com/mcollective/reference/integration/activemq_security.html)
* [Stomp](http://stomp.codehaus.org/)
* [Stomp RubyGem](http://rubygems.org/gems/stomp)
