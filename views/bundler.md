# Bundler

## Create Gemfile for Project

	$ bundle init

## Define Dependencies

Edit `Gemfile` and use the `gem` function to define dependencies:

	gem 'rails'
	gem 'rails', '3.1.0'
	gem 'mysql2', '~> 0.2.11'

## Install Dependencies

	bundle install

## Define Groups of Dependencies

Use the `group` function to group together environment-specific gems:

	gem 'rails', '3.1.0'

	group :development do
	  gem 'heroku_san'
	end

## Exclude Groups from Install

	bundle install --without development
