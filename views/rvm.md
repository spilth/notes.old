# Ruby Version Manager

These are my notes on install RVM on Mac OS X. More information on RVM can be found at the [RVM Web Site](http://rvm.beginrescueend.com/)

## Installation

To install RVM use the following command:

	bash < <(curl -B http://rvm.beginrescueend.com/install/rvm)

Edit your `~/.profile` and add the following

	[[ -s "/Users/brian/.rvm/scripts/rvm" ]] && source "/Users/brian/.rvm/scripts/rvm"  # This loads RVM into a shell session.

Then reload your `~/.profile` for the changes to take effect

	$ source .profile

## Replace System Ruby with an RVM-managed version

	rvm install 1.8.7
	rvm system ; rvm gemset export system.gems ; rvm 1.8.7 ; rvm gemset import system

## Install 1.9.2 and make it the default

	rvm install 1.9.2
	rvm --default 1.9.2
