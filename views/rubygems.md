# RubyGems

## Prerequisites

It is assumed you have already installed the following:

* [Ruby](http://www.ruby-lang.org/)

To easily switch between different versions of Ruby on one machine, read my note on [Ruby Version Manager](/rvm).

## Installation on Mac

After downloading RubyGems from [http://rubygems.org/pages/download](http://rubygems.org/pages/download), open up Terminal and do the following:

	$ cd ~/Downloads
	$ tar -zxvf rubygems-1.6.2.tgz 
	$ cd rubygems-1.6.2
	$ sudo ruby setup.rb
	
## Common Commands	

### Update RubyGems

	$ sudo gem update --system

### Find a Gem to Install

	$ gem list rails -r
	
### Install a Gem

	$ sudo gem install bundler

### List Installed Gems

	$ gem list --local

### Clean Out Older Versions of Gems

	$ gem clean
	