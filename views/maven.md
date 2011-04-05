# Maven

## Installing Maven on Mac OS X

After downloading Maven 3.0.3 from [http://maven.apache.org/download.html](http://maven.apache.org/download.html)

    tar -zxvf apache-maven-3.0.3.tar.gz
    mv apache-maven-3.0.3 /Users/brian/Applications/

Then edit `~/.profile` and add the following:
    
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
    export M2_HOME=/Users/brian/Applications/apache-maven-3.0.3
    export PATH=$PATH:$M2_HOME/bin

Once you're done editing you can run the following command to immediately execute your profile updates:

    source ~/.profile

## Creating Maven Projects

### Create a Maven Project Using Archetypes Interactively

	$ mvn archetype:generate

### Create a Maven Project Using Archetypes Non-interactively

	$ mvn archetype:generate -DgroupId=com.example -DartifactId=hello -Dversion=1.0-SNAPSHOT -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

## Use a Repository as a Mirror

Edit `~/.m2/settings.xml` and add the following:

	<settings>
	  ...other stuff...
	  <mirrors>
	    <mirror>
	      <id>archiva</id>
	      <name>Archiva</name>
	      <url>http://localhost/archiva/</url>
	      <mirrorOf>*</mirrorOf>
	    </mirror>
	  </mirrors>
	</settings>

## Supply Authentication Information for a Repository

The `id` element of the server should match the `id` of the repository you are providing information for.

    <settings>
      <servers>
        <id>serverId</id>
        <username>username</username>
        <password>password</password>
      </servers>
    </settings>

## Installing a non-Mavenized Artifact 

### Install an Artifact to your Local Repository

    $ mvn install:install-file -Dfile=outsider.jar - DgroupId=com.badexample -DartifactId=outsider -Dversion=1 -Dpackaging=jar -DgeneratePom=true

### Deploy a Dependency to your own Maven Repository

	$ mvn deploy:deploy-file -DgroupId=com.example -DartifactId=hello -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -Dfile=hello-1.0.0.jar -Durl=???
