# ActiveMQ

## JMS

* JMS is an API for enterprise messaging.
* Included in Java EE
* Loosely coupled

## Providers

* WMQ (WebSphereMQ)
* ActiveMQ
* TIBCO
* SonicMQ

## Messages

* headers (pre-defined)
* properties (user-defined)
* payload (object you're sending)

## Messaging Domains

* point to point - many receivers looking at queue
 * one receiver is the destination
* publish/subscribe
 * all subscribers to topic get message

## ActiveMQ (implementation of JMS)

* Message-oriented Middleware
* sits between sender and receiver
* JMS 1.1 compliant

* Standards-based, message-oriented

ActiveMQ is really just a bunch of beans and bean factories running on top of the Spring framework.


## Configuration

### Transport Connectors

TransportConnectors define how clients talk to ActiveMQ

Uses URI Syntax

	<protocol>://<host>:<port>?<transport-options>

	tcp://localhost:61616
	stomp://localhost:61613
	
## Transports

* VM
* TCP
* Stomp
* Failover

### Types of Transports

* Transport Connector
 * Client <-> Broker
* Network Connector
 * Broker <-> Broker

## Wire Formats

* OpenWire
* STOP
* XMPP
* REST
* AMQP

### Transport Connectors

Client to broker connections. Similar to a JDBC connection to a database

Protocols supported:

* TCP
* UDP
* NIO
* SSL
* HTTP(S)
* VM
* XMPP

## Network of Brokers

Broker to broker connections. Typically for scalability.

Protocols supported:

* Static
* Failover
* Multicast
* Zeroconf
* Peer
* Fanout
* Discovery

## Message Persistence

* AMQ Message Store
 * Default persistence mechanism. Similar to Berkeley DB
 * Data Store and Reference Store are separate.
 * Default in ActiveMQ 5.x
* Non-Journaled JDBC
 * Not recommend.
* Journaled JDBC
 * Default in ActiveMQ 4.x

## Message Cursors

* Messages are no longer stored in memory (ActiveMQ 5.1+)
* Messages are paged in from storage when space is available in memory

## Master/Slave Broker Configurations

3 Types available:

* Pure
* Shared filesystem
* Shared JDBC

## Security

* Authentication
 * File Based
 * JAAS Based
* Authorization
 * Destination Level
 * Message Level

## Consumer Options

### Message Prefetch (Throttling)

* Used for slow consumers
* FIFO buffer on consumer side

### Async Dispatch

* Asynchronous message delivery to consumers
* Useful for slow consumers

### Exclusive Consumers

### Consumer Priority

* Weight consumer priority

### Message Groups

### Redelivery Policy

Messages are redelivered when:

* A transaction is rolled back
* A transaction is closed before commit
* Session is using CLIENT_ACKNOWLEDGE and Session.recover() is called

### Retroactive Consumer

* Messages replay at start of a subscription

### Wildcards on Destinations

	# Recursively Down
	Price.>
	# Non-Recursive
	Price.Stock.*.IBM

### Message Selectors

Query headers to filter a subscription

* JMS Selectors (against headers)
* XPath Selectors (against XML content)

### Virtual Destinations

Consolidate multiple subscriptions into 1

### Total Ordering

Guaranteed order of message for each consumer

### Mirrored Queues

## Monitoring

* JMX
* Web Console
* Apache Camel Routes (Integration Framework)
* SpringSource AMS
* IONA FuseHQ

## Visualization

## Resources

* [Introduction to Messaging With Apache ActiveMQ - Bruce Snyder](http://vimeo.com/12654513)
