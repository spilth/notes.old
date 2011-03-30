# Logging with Java

## Why use a Logging Framework?

* You want to be able to change the amount of information logged by your app without recompiling your app
* You want to be able to change how information is logged (console, file, database) without recompiling your app
* You want to be able to change the format of logged information without recompiling your app
* You want to be able to change the entire logging system without recompiling your app

## Logging Frameworks

### java.util.logging

Added in Java 1.4.2?

#### Example

Java Class:

	import java.util.logging.Logger;

	public class JULTest {
		public static void main(String[] args) {
			Logger logger = Logger.getLogger("test");
			logger.info("Hello, JUL!");
		}
	}

### Log4J

* http://logging.apache.org/log4j/
* log4j-1.2.15.jar
* Properties can be defined by a properties file or by an XML file. Log4j looks for a file named log4j.xml and then for a file named log4j.properties. Both must be placed in the src folder.
* XML requires the log4j.dtd to be placed in the source folder as well
* XML requires a dom4j.jar which might not be included in older Java versions
* The properties file does not support some advanced configuration options

#### Example

Create `log4j.properties`:

	# log4j.properties
	# log4j.rootLogger=<level>, <appenderName>
	log4j.rootLogger=DEBUG, console
	# log4j.appender.<appenderName>=<appenderClass> (ConsoleAppender, FileAppender, SMTPAppender, RollingFileAppender, AsyncAppender, JDBCAppender, JMSAppender, LF5Appender, NTEventLogAppender, NullAppender, NullAppender, SMTPAppender, SocketAppender, SocketHubAppender, SyslogAppender, TelnetAppender, DailyRollingFileAppender, RollingFileAppender)
	log4j.appender.console=org.apache.log4j.ConsoleAppender
	# log4j.appender.<appenderName>.layout=<layoutClass> (DateLayout, HTMLLayout, PatternLayout, SimpleLayout, XMLLayout)
	log4j.appender.console.layout=org.apache.log4j.PatternLayout
	log4j.appender.console.layout.ConversionPattern=%d [%t] %-5p %c %x - %m%n

Trimmed example `log4j.properties`:

	log4j.rootLogger=DEBUG, console
	log4j.appender.console=org.apache.log4j.ConsoleAppender
	log4j.appender.console.layout=org.apache.log4j.PatternLayout
	log4j.appender.console.layout.ConversionPattern=%d [%t] %-5p %c %x - %m%n

Java Class:

	import org.apache.log4j.Logger;

	public class Log4JTest {
		public static void main(String[] args) {
			Logger logger = Logger.getLogger("log4j");
			logger.error("Hello, Log4J!");
		}
	}


### Simple Logging Facade for Java (SLF4J)

* http://www.slf4j.org/
* a simple facade or abstraction for various logging frameworks (java.util.logging, log4j, logback) allowing the end-user to plug in the desired logging framework at deployment time
* SLF4J suffers from none of the class loader problems or memory leaks observed with Jakarta Commons Logging
* Authors of widely-distributed components and libraries may code against the SLF4J interface in order to avoid imposing an logging framework on the end-user of the component or library
* slf4j-api-1.6.1.jar
* slf4j-simple-1.6.1.jar

#### Example

	import org.slf4j.Logger;
	import org.slf4j.LoggerFactory;

	public class SLF4JTest {
		public static void main(String[] args) {
			Logger logger = LoggerFactory.getLogger("slf4j");
		    logger.info("Hello, SLF4J");
		}
	}

### Java Commons Logging

* http://commons.apache.org/logging/
* a thin wrapper above different logging frameworks
* commons-logging-1.1.1.jar

#### Example

	package org.spilth.examples;

	import org.apache.commons.logging.Log;
	import org.apache.commons.logging.LogFactory;

	public class JLCTest {

		public static void main(String[] args) {
			Log log = LogFactory.getLog("test");
			log.info("Hello, JCL!");
		}
	}
