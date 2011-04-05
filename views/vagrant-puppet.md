# Vagrant and Puppet

## Puppet

Note: You __do not__ need to install Puppet on your host.

Edit your `Vagrantfile` to contain the following:

	config.vm.provision :puppet do |puppet|
		...other stuff...
    	puppet.manifests_path = "manifests"
    	puppet.manifest_file  = "centos55.pp"
	end
  
Within your Vagrant's project folder, create `manifests/centos55.pp`

	class centos55 {
	  $basePackages = ["svn", "git", "unzip", "emacs"]
	  package {$basePackages: ensure => present}
	}

	include centos55

Then use the following command to provision your VM

	$ vagrant provision

## Installing Vagrant from Source

I was having an issue where trying to run Puppet provisioning resulted in a "Unknown Terminal Type" error. This was fixed by installed Vagrant from the source. The current Gem version is 0.7.2.

	$ gem list vagrant
	> vagrant (0.7.2)

	$ mkdir ~/temp
	$ cd ~/temp
	$ git clone https://github.com/mitchellh/vagrant.git
	$ cd vagrant

The network at work doesn't allow non-http/https connections to the outside world, so I need to alter the following in the project's `Gemfile`:

	gem "virtualbox", :git => "https://github.com/mitchellh/virtualbox.git"

Once that was done:

	$ bundle install
	$ rake install
	$ vagrant -v
	Vagrant version 0.7.3.dev

More details can be found at [Installing Vagrant from Source](https://github.com/mitchellh/vagrant/wiki/Installing-Vagrant-from-source)
