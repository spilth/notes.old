# Vagrant

>Vagrant is a tool for building and distributing virtualized development environments.

## Pre-requisites

To use Vagrant you need the following installed on your system:

* [Ruby](http://www.ruby-lang.org/en/)
* [RubyGems](http://rubygems.org/)
* [Git](http://git-scm.com/) if you want to build from source, which I had to do
* [VirtualBox 4.0+](http://www.virtualbox.org/wiki/Downloads)

## Install Vagrant

Vagrant is a Ruby Gem, so we use the `gem` command to install it.

	$ gem install vagrant

You'll need to have VirtualBox installed to make use of Vagrant, so make sure you download and install version 4+ of that from the [VirtualBox Downloads Page](http://www.virtualbox.org/wiki/Downloads)

## Vagrant Boxes

### Add a Vagrant Box to your local Vagrant repository

Once you have the gem installed you'll want to add a box that you can use to create your own VMs from.

	$ vagrant box add base http://files.vagrantup.com/lucid32.box

A list of available boxes are at [Available Vagrant Boxes](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes)

### List Box types available locally

	$ vagrant box list

## Create a Vagrant Project

You'll likely want to set up directories for each Vagrant project you set up:

	$ mkdir /some/dir
	$ cd /some/dir
	$ vagrant init base

## Vagrant Commands

### Start up your Vagrant VM

	$ vagrant up

### Get the status of your VM

	$ vagrant status

### SSH to your VM

	$ vagrant ssh

### Suspend your VM

	$ vagrant suspend
	$ vagrant status

### Resume you VM

	$ vagrant resume
	$ vagrant status

### Shutdown the VM

	$ vagrant halt
	$ vagrant status

## Vagrant Projects

In the root of your project's directory you'll find `Vagrantfile`. This file configures your VM.

	Vagrant::Config.run do |config|
	  config.vm.box = "base"
	end
