# Code Coverage with Maven

## Cobertura

* http://cobertura.sourceforge.net/
* http://mojo.codehaus.org/cobertura-maven-plugin/
* http://mojo.codehaus.org/cobertura-maven-plugin/usage.html
* http://ecobertura.johoop.de/

Add the following to your `pom.xml`:

	<reporting>
	 	<plugins>
			<plugin>
	    		<groupId>org.codehaus.mojo</groupId>
	    		<artifactId>cobertura-maven-plugin</artifactId>
	    		<version>2.5.1</version>
	    	</plugin>
		</plugins>
	</reporting>

Run it with:

	mvn cobertura:cobertura

## EMMA

* http://emma.sourceforge.net/
* http://emma.sourceforge.net/maven-emma-plugin/

Add the following to your `pom.xml`:

	<plugin>
		<groupId>emma</groupId>
		<artifactId>maven-emma-plugin</artifactId>
	</plugin>

Run it with:

	mvn emma:emma
	
Doesn't get included by `mvn site:site`.
