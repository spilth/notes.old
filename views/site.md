# Simple Notes Site with Sinatra, Markdown and Heroku

## Sinatra

http://www.sinatrarb.com/

	$ gem install sinatra
	$ mkdir notes
	$ cd notes
	$ mate notes.rb

Use the follwing as the contents of notes.rb

	require 'sinatra'

	get '/' do
  		"This is the index!"
	end

When you're done, try out your app:

	$ ruby -rubygems notes.rb

It will now be running on http://localhost:4567/

## Markdown

http://daringfireball.net/projects/markdown/

gem install rdiscount

mate views/notes-site.md

## Rack App

.gems

sinatra

mate config.ru

require './notes.rb'
run Sinatra::Application

$ mkdir views
$ mate views/layout.erb

<html>

  <head>
	<title>Notes</title>
  </head>

  <body>
	<%= yield %>
  </body>

</html>

## Git

Now it's time to make a Git repository from our application:

	git init
	git add .
	git commit -m "Initial commit"

## Heroku

Sign up for Heroku

http://heroku.com/
http://devcenter.heroku.com/articles/quickstart

	gem install heroku
	heroku create
	git push heroku master


https://api.heroku.com/myapps

http://sharp-ocean-239.heroku.com/
