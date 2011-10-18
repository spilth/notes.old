# Maven

## Installing Maven on Mac OS X

After downloading Maven 3.0.3 from [http://maven.apache.org/download.html](http://maven.apache.org/download.html)

    $ tar -zxvf apache-maven-3.0.3.tar.gz
    $ mv apache-maven-3.0.3 /Users/brian/Applications/

Then edit `~/.profile` and add the following:
    
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
    export M2_HOME=/Users/brian/Applications/apache-maven-3.0.3
    export PATH=$PATH:$M2_HOME/bin

Once you're done editing you can run the following command to immediately execute your profile updates:

    $ source ~/.profile

## Maven Coordinates

Wether you are creating a new Maven project from scratch, joining a Maven project or referencing a Maven project you will need 3 pieces of information to identify the project:

* `groupId`: Represents the group the project belongs to. This is generally a reverse domain name like most Java packages use. This value will likely not change over the course of your project's development. Example:
* `artifactId`: The name of your project. This needs to be unique within the groupId you provided above. This value will also not change over time. Example: `helloworld`
* `version`: Represents the version of your application and usually done in an X.Y.Z type format. Version will change over time if your project goes through several releases and updates. You will also often see the word SNAPSHOT in the version property. This represents a project being in a development state and not being a stable, released version yet. Example: `1.0-SNAPSHOT`

## Creating Maven Projects

There are a few ways you can create a Maven project, including by hand, but the easiest method is to use the Archetype plugin.

### Create a Maven Project Using Archetypes Interactively

To be walked through the creation of a project, use the `achetype:generate` plugin and goal. This will prompt you for your projects coordinates and then generate a `pom.xml`.

	$ mvn archetype:generate

### Create a Maven Project Using Archetypes Non-interactively

	$ mvn archetype:generate -DgroupId=com.example -DartifactId=hello -Dversion=1.0-SNAPSHOT -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

## Dependencies

Most Java project rely on libraries for some of their functionality, usually require at compilation and run-time, but sometimes just during testing. Sometimes the library is necessary for compilation but doesn't need to be packaged with the project since it will be provided by the container (such as Tomcat) that it will end up running in.

Maven provides a mechanism with which to define these dependencies and the scope of their usage. They are defined in the `<dependencies>` section of your project's `pom.xml`. For example, in order to depend on JUnit 4 during testing of your project, put the following in your POM:
	
	<dependencies>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.8.2</version>
			<scope>test</scope>
		</dependency>
	</dependencies>

The `groupId`, `artifactId` and `version` are the coordinates of the project you need and the `scope` attribute identifies how the dependency will be used.

Scope can have one of the following values:

* foo
* bar

## Use a Hosted Repository as a Mirror

Edit `~/.m2/settings.xml` and add the following:

	<settings>
		<!-- other stuff -->
		<mirrors>
			<mirror>
				<id>archiva</id>
				<name>Archiva</name>
				<url>http://localhost/archiva/</url>
				<mirrorOf>*</mirrorOf>
			</mirror>
		</mirrors>
	</settings>

## Installing a non-Mavenized Artifact 

Sometimes your project will depend on a library that isn't a Maven artifact itself. In those cases you'll need to install it to your local repository or a hosted repository.

### Install an Artifact to your Local Repository

    $ mvn install:install-file -Dfile=outsider.jar - DgroupId=com.badexample -DartifactId=outsider -Dversion=1 -Dpackaging=jar -DgeneratePom=true

### Deploy a Dependency to your a Hosted Repository

	$ mvn deploy:deploy-file -DgroupId=com.example -DartifactId=hello -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -Dfile=hello-1.0.0.jar -Durl=???

## Deploy Your Project to a Hosted Repository

If you're hosting your own Maven Repository you'll likely want to be able to deploy your own projects to it.

### Add your Host Repository to your Project

First you need to add you hosted repositories to your project's `pom.xml`:

	<project>
		<!-- other stuff -->
		<distributionManagement>
			<repository>
				<id>internal</id>
				<url>http://maven.example.com/archiva/repository/internal/</url>
			</repository>
			<snapshotRepository>
				<id>snapshots</id>
				<url>https://maven.example.com/archiva/repository/snapshots/</url>
			</snapshotRepository>
		</distributionManagement>
	</project>
	
### Provide Authentication for Server

Edit your `~/.m2/settings.xml` and add the following:

	<settings>
		<!-- other stuff -->
		<servers>
			<server>
				<id>internal</id>
				<username>username</username>
				<password>password</password>
			</server>
			<server>
				<id>snapshots</id>
				<username>username</username>
				<password>password</password>
			</server>
		</servers>
	</settings>
	
Now you can run:

	$ mvn deploy

## Snapshot vs. Release

### Snapshot

Artifacts generated by projects that are actively being developed are considered Snapshots. If your project depends on other artifacts that are Snapshots, it will try to resolve the latest version of that artifact.

If the `version` property contains the string `SNAPSHOT`, Maven will replace this with a date/timestamp when you `install` or `depoy` the artifact.

### Release

> When releasing a project, you should resolve all dependencies on SNAPSHOT versions to dependencies on released versions.

## Build Profiles

### Specify the Build Profile via Command Line Options

You can set the current profile to build with using the `-activate-profile` or `-P` command-line switches:

	$ mvn compile -P <profileId>
	$ mvn test -activate-profiles local

### Specify the Build Profile via User's Settings File


You can set a default build profile using the `activeProfiles` element inside of `~/.m2/settings.xml`:

	<settings>
	  <!-- other stuff -->
	  <activeProfiles>
	    <activeProfile>local</activeProfile>
	  </activeProfiles>
	</settings>

## Resources

* [Maven: The Complete Reference](http://sonatype.com/books/mvnref-book/reference/public-book.html)
* [Maven by Example](http://www.sonatype.com/books/mvnex-book/reference/public-book.html)
* [Developing with Eclipse and Maven](http://www.sonatype.com/books/m2eclipse-book/reference/)
* [Repository Management with Nexus](http://www.sonatype.com/books/nexus-book/reference/)
