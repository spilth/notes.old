# Puppet

## Manifests

Puppet programs are called manifests and use .pp as an extension.

Create an example file named `test.pp` with the following contents:

	file {'testfile':
	  path    => '/tmp/testfile',
	  ensure  => present,
	  mode    => '640',
	  content => "I'm a test file.",
	}
	
Then run puppet against this file:

	$ puppet test.pp
	notice: //File[testfile]/ensure: created
	$ less /tmp/testfile 
	I'm a test file.

## Resources

Resource describe some aspect of a system: files, services, packages, custom resources.  They are identified by a title and can have attributes with values.

	<resourceType> { '<resourceTitle>:
		attributeName1 => attributeValue1,
		attributeName2 => attributevalue2,
		...
	}

Almost every resource type has an attribute whose value defaults to the resource's `title`. For example:

* `path` attribute for `file` resource type
* `message` attribute for `notify` resource type
* `name` attribute for `usre`, `group`, `package` resource types

More info here:

* [Puppet Types Reference](http://docs.puppetlabs.com/references/stable/type.html)
* [Core Type Cheat Sheet (PDF)](http://docs.puppetlabs.com/puppet_core_types_cheatsheet.pdf)

### Resource Defaults

You can define defaults for resource types by using the capitalized resource type name, no title and a list of default values for attributes.

	ResourceType {
		attributeName1 => defaultValue1,
		attributeName2 => defaultValue2,
		...
	}

	File {
		mode => 644,
	}

The defaults you assign only work within the current scope and below. Resources can still override the defaults with their own attribute values.

### Undefining Attributes

Attribute values can be undefined using the value `undef`:

	File['/etc/passwd'] {
		group => undef
	}

### Adding Values to Attributes

You can add to already defined attribute values by using `+>` instead of `=>`

	class apache {
		service { 'apache': require => Package['httpd'] }
	}

	class apache-ssl inherits apache {
		# host certificate is required for SSL to function
		Service[apache] { require +> File['apache.pem'] }
	}
	
## Metaparameters

Metaparameters are a set of attributes that can be used on any resource. They describe how Puppet should act, not anything specific about the resource.

Four metaparameters let you arrange resources in order:

* `before`: lists resource(s) that depend on this resource
* `require`: lists resource(s) that this resource depends on
* `notify`: 
* `subscribe`: lidts resource(s) this resource should watch for changes

There value should be a Resource Reference or an array of Resource References.

### Resource Reference

A resource reference consists of a capitalized resource type name and the title of the resource you are referring to.

	ResourceType['resourceTitle']

## Chaining

	File['/tmp/test1'] -> Notify['after']

## Classes (Puppet 2.6.0+)



	class <className> {
		# ...resource definitions...
	}
	
	class <className> inherits <superclassName> {
		# ...resource definitions...
	}

## Defined Resource Types

Defined Resource Types look like a way to create a function with arguments that define resources. Arguments become attributes of the defined resource type.

	define svn_repo($path) {
		exec { "/usr/bin/svnadmin create $path/$title":
			unless => "/bin/test -d $path",
		}
	}

	svn_repo { puppet_repo: path => '/var/svn_puppet' }
	svn_repo { other_repo:  path => '/var/svn_other' }

## Modules

Modules combine classes, defined types and resources into re-usable configurations.

## Nodes



## Examples

### Conditional Naming & Subscribe Metaparameter

	file { 'sshdconfig':
		name => $operatingsystem ? {
			solaris => '/usr/local/etc/ssh/sshd_config',
			default => '/etc/ssh/sshd_config',
		},
		owner => root,
		group => root,
		mode  => 644,
	}
	
	service { 'sshd':
		subscribe => File[sshdconfig],
	}
