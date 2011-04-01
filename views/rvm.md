# Ruby Version Manager

> RVM is a command line tool which allows us to easily install, manage and work with multiple ruby environments from interpreters to sets of gems. 

More information on RVM can be found at the [RVM web site](http://rvm.beginrescueend.com/)

## Installation on Mac OS X

To install RVM use the following command:

	$ bash < <(curl -B http://rvm.beginrescueend.com/install/rvm)

Edit your `~/.profile` and add the following:

	[[ -s "/Users/brian/.rvm/scripts/rvm" ]] && source "/Users/brian/.rvm/scripts/rvm"  # This loads RVM into a shell session.

Then reload your `~/.profile` for the changes to take effect

	$ source .profile

## Common Commands

### Install a Specific Version of Ruby

	$ rvm install 1.9.1
	
### Make a Specific Version of Ruby the Default
 
	$ rvm --default 1.9.2

### Replace System Ruby with an RVM-managed version

	$ rvm install 1.8.7
	$ rvm system
	$ rvm gemset export system.gems
	$ rvm 1.8.7
	$ rvm gemset import system
