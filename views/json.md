# JSON

> [JSON](http://www.json.org/) (JavaScript Object Notation) is a lightweight data-interchange format.

## Structure

JSON is built on two structures:

* A collection of name/value pairs.
  * In various languages, this is realized as an object, record, struct, dictionary, hash table, keyed list, or associative array.
* An ordered list of values.
  * In most languages, this is realized as an array, vector, list, or sequence.

## Objects

* An object is an unordered set of name/value pairs.
* An object begins with { (left brace) and ends with } (right brace).
* Each name is followed by : (colon) and the name/value pairs are separated by , (comma).

### Example

	{
	name: "Brian Kelly",
	age: 36
	}

## Array

* An array is an ordered collection of values.
* An array begins with [ (left bracket) and ends with ] (right bracket).
* Values are separated by , (comma).

### Example

	[4, 8, 15, 16, 23, 42]

## Values

* A value can be a string in double quotes, or a number, or true or false or null, or an object or an array.
* These structures can be nested.

### Example

An array of people objects:

	[
		{
			first: "Arthur",
			lastname: "Dent"
		},
		{
			firstname: "Ford",
			lastname: "Prefect"
		}
	]

## Strings

* A string is a sequence of zero or more Unicode characters, wrapped in double quotes, using backslash escapes.
* A character is represented as a single character string.
* A string is very much like a C or Java string.
