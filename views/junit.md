# JUnit

> JUnit is a simple framework to write repeatable tests. It is an instance of the xUnit architecture for unit testing frameworks. 

* [JUnit](http://www.junit.org/)
* [JUnit at SourceForge](http://junit.sourceforge.net/)

## The Basics

* Put your tests in a parallel directory structure
  * If your code is in `src/main/java` put your tests in `src/tests/java`
  * This allows you to test protected methods in your classes but makes it easy to avoid putting your test classes in your JAR/WAR.
* Create a class for your test
  * If the class your testing is `Reverser` name your test class `ReverserTest`
* Import `org.unit.Test`
* Import JUnit Assertions as needed
* Use the `@Test` annotation to identify your test methods
* Use [JUnit's assert methods](http://junit.sourceforge.net/javadoc/org/junit/Assert.html) to test your code
  * Consider using the version of the assert method with a message String as the first argument for better failure descriptions

The following tests the reverseString method of the Reverser class:

	package com.buildndeploy.example;

	import static org.junit.Assert.*;

	import org.junit.Test;

	public class ReverserTest {

		@Test
		public void testReverse() {
			//assertEquals(String message, Object expected, Object actual) 
			assertEquals("reverseString failed!", "avaj", Reverser.reverse("java"));
		}
	}

### Testing Exceptions

If you need to test that a method throws an exception under certain conditions, use the `expected` parameter of the `@Test` annotation to specify the exception class that's expected to be thrown.

	@Test(expected=IndexOutOfBoundsException.class)
	public void testLongOperation() {
		//...
		myObject.methodThatThrowsIndexOutOfBounds();
	}
	

### Test Timeouts

If a method taking too much time is a measurement of failure, use the `timeout` parameter of `@Test` to set a time limit in milliseconds.

	@Test(timeout=100)
	public void testLongOperation() {
		//...
	}

## Fixtures

Sometimes you have common code that needs to be run before each test method is called, such as setting up objects to use in multiple tests. To help remove duplicate code you can annotate non-test methods with `@Before` to have those methods run before each test method. If the objects created in the `@Before` method(s) have resources that need to be released you can create a non-test method annotated with @After to accomplish that.

Note that if multiple methods are annotated as `@Before` or `@After` that there is no guarantee that one method will be called before the other.

If the setup you need to perform is resource heav then you can put your code in a `public static void` method with no arguments and annotate it with `@BeforeClass`. Like `@Before`, `@BeforeClass` has a partner annotation named `@AfterClass`

## Ignoring Tests

Sometimes you need to ignore a test for some reason. `@Ignore` Can be applied to entire class or individual methods.

	@Ignore("not ready yet")
	@Test
	public void testNotReadyForPrimeTime() {
		//...
	}

## Adding JUnit 4 to a Maven Project

If you want to use JUnit 4 in a Maven project, add the following to your `pom.xml` for JUnit 4 support:

	<dependencies>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.8.2</version>
			<scope>test</scope>
		</dependency>
	</dependencies>

The `test` value for scope indicates that JUnit is only used for the compilation and execution of tests.