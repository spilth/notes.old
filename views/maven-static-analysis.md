# Static Analysis with Maven

## PMD

> PMD scans Java source code and looks for potential problems

* [PMD](http://pmd.sourceforge.net/)
* [PMD Maven Plugin](http://maven.apache.org/plugins/maven-pmd-plugin/)
* [PMD for Eclipse](http://pmd.sourceforge.net/eclipse/)

To add PMD to your Maven project, add the following to your `pom.xml`:

	<reporting>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-pmd-plugin</artifactId>
				<version>2.5</version>
				<configuration>
					<rulesets>
						<ruleset>/rulesets/unusedcode.xml</ruleset>
						<ruleset>/rulesets/basic.xml</ruleset>
					</rulesets>
				</configuration>
			</plugin>
		</plugins>
	</reporting>
	
To run PMD, use the following:

	mvn pmd:pmd

By default the report will be available at `target/site/pmd.html`

### Copy/Paste Detection	
	
To run PMD's Copy/Paste detector, use the following:

	mvn pmd:cpd

By default the report will be available at `target/site/cpd.html`

### JXR

> The JXR Plugin produces a cross-reference of the project's sources. The generated reports make it easier for the user to reference or find specific lines of code.

To add JXR support to your Maven project, add the following to your `pom.xml`:

	<reporting>
		<plugins>
			<!-- pmd and other reporting plugins -->
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-jxr-plugin</artifactId>
				<version>2.2</version>
			</plugin>
		</plugins>
	</reporting>
	
By default your source code will be available at `target/site/xref/index.html`

## Findbugs

## CheckStyle

## Sonar

* http://www.sonarsource.org/
* http://docs.codehaus.org/display/SONAR/Analyse+with+Maven
* http://docs.codehaus.org/display/SONAR/Hudson+and+Jenkins+Plugin

Run Sonar with:

	mvn sonar:sonar
