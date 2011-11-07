# Rake

> A make-like build utility for Ruby.

[Rake on Github](https://github.com/jimweirich/rake)

Rakefiles are just executable Ruby code.

## Define A Task

To define a task use the `task` method with a name:

	task :test do
	  ruby "test/unittest.rb"
	end

This can be run by typing `rake test`.

## Set Default Task

To create a default task set up a task named `default`:

	task :default do
		# Stuff
	end

This can be run by typing just `rake`.

## Define Prerequisites for a Task

Assign your task to an array tasks to run:

	task :hello => [:foo, :bar]
	
	task :goodbye => [:foo, :bar] do |task|
		# Stuff
	end
