# Vagrant and Puppet

## Pre-requisites

To use Vagrant you need the following installed on your system:

* [Ruby](http://www.ruby-lang.org/en/)
* [RubyGems](http://rubygems.org/)
* [Git](http://git-scm.com/) if you want to build from source (which I had to do)
* [VirtualBox 4.0+](http://www.virtualbox.org/wiki/Downloads)

## Vagrant Basics

http://vagrantup.com/

## Install Vagrant

	gem install vagrant

`~/.vagrant` directory: stores boxes, logs, tmp

## Add a Vagrant Box to your local Vagrant repository

	vagrant box add base http://files.vagrantup.com/lucid32.box

## Create a Vagrant Project

	mkdir /some/dir
	cd /some/dir
	vagrant init base # Create Vagrantfile in current directory

## Start up your Vagrant VM

	vagrant up # Set up VM based on Vagrantfile settings
	vagrant status

## SSH to your Vagrant VM

	vagrant ssh

## Suspent your Vagrant VM

	vagrant suspend # Put the VM to Sleep
	vagrant status

## Resume you Vagrant VM

	vagrant resume # Wake the VM up
	vagrant status

## Shutdown the VM

	vagrant halt # Power Off the VM
	vagrant status

## List Box types available locally

	vagrant box list

## List of available boxes

A list of available boxes are at [Available Vagrant Boxes](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes)


## Vagrant Projects

Vagrantfile

	Vagrant::Config.run do |config|
	  # Setup the box
	  config.vm.box = "my_box"
	end

## Puppet

Create `manifests/base.pp`

	class base {
	  package { "git":
	    ensure => present,
	  }

	}

	include base

## Installing Vagrant from Source

I was having an issue where trying to run Puppet provisioning resulted in a "Unknown Terminal Type" error. This was fixed by installed Vagrant from the source. The current Gem version is 0.7.2.

	gem list vagrant
	> vagrant (0.7.2)


	mkdir ~/temp
	cd ~/temp
	git clone https://github.com/mitchellh/vagrant.git
	cd vagrant

The network at work doesn't allow non-http/https connections to the outside world, so I need to alter the folowing in the projects `Gemfile`:

	gem "virtualbox", :git => "https://github.com/mitchellh/virtualbox.git"

Once that was done:

	$ bundle install
	$ rake install
	$ vagrant -v
	Vagrant version 0.7.3.dev

And I was able to run:

	vagrant provision

More details can be found at [Installing Vagrant from Source](https://github.com/mitchellh/vagrant/wiki/Installing-Vagrant-from-source)

## Finding Packages

	vagrant ssh
	apt-cache search <name>
	apt-cache show <name>

	class base {
		package { "git-core":
	 	 ensure => present,
		}

		package { "subversion":
		  ensure => present,
		}

	}

	include base

## CentOS 5.5

	$ vagrant box add centos55 http://dl.dropbox.com/u/447700/centos55.box
	$ mkdir centos
	$ vagrant init centos55
	$ vagrant up
	$ mkdir manifests
	$ mate manifests/centos55.pp

	$ vagrant ssh
	yum list git
