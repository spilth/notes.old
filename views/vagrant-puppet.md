# Vagrant and Puppet

It's assume you already have Vagrant installed and set up

## Puppet

You don't need to install Puppet on your host.

Within your Vagrant's project folder, create `manifests/base.pp`

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