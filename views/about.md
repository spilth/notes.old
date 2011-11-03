# How This Site Is Generated and Hosted

This site is a [Sinatra](http://www.sinatrarb.com/) application running at [Heroku](http://heroku.com/). I'm using [Markdown](http://daringfireball.net/projects/markdown/) to create my notes and using [DNSimple](https://dnsimple.com/) to register and manage the domain `buildndeploy.com`. The beautiful layout and styling is provided by [Bootstrap, from Twitter](http://twitter.github.com/bootstrap/).

The goal of this app is to be able to make notes about various technologies and generate a web site that I can reference and quickly update and expand. The process of creating a new Markdown file should result in a new page showing up on the site.  Below are instructions for how I set up the site.

## Pre-Requisites

These instructions assume you have already installed the following:

* [Ruby](http://www.ruby-lang.org/en/)
* [RubyGems](http://rubygems.org/)
* [Git](http://git-scm.com/)

## Sinatra

> Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort.

Use RubyGems to install Sinatra:

	$ gem install sinatra

## Markdown Support

> Markdown is a text-to-HTML conversion tool for web writers. Markdown allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid XHTML (or HTML).

For converting Markdown to HTML in Ruby we'll be using the [rdiscount Gem](https://github.com/rtomayko/rdiscount):

	$ gem install rdiscount

## Create a Sinatra Project

	$ mkdir notes
	$ cd notes

Create the file `notes.rb` and use the following as the contents:

	require 'sinatra'
	require 'rdiscount'
	require 'erb'

	set :markdown, :layout_engine => :erb

	get '/' do
	  @topics = nil

	  Dir.chdir(File.dirname(__FILE__) + "/views/") do
	    @topics = Dir.glob("*.md")
	  end

	  @topics.reject! {|entry| entry == "index.md"}
	  @topics.collect! {|entry| entry.split(".")[0]}
	  @topics.sort!

	  erb :index
	end

	get '/source' do
	  redirect to('/index/source')
	end

	get '/:topic' do
	  @topic = params[:topic]
	  markdown params[:topic].to_sym
	end

	get '/:topic/source' do
	  send_file File.dirname(__FILE__) + "/views/#{params[:topic]}.md", :type => :text
	end

## Making A Page

Be default Sinatra looks for templates inside of a `views` directory in your project.

	$ mkdir views

Now create a file named `about.md` inside of `views` with the following contents:

	# How This Site Is Generated and Hosted

	This site is a [Sinatra](http://www.sinatrarb.com/) application running at [Heroku](http://heroku.com/). I'm using [Markdown](http://daringfireball.net/projects/markdown/) to create my notes and using [DNSimple](https://dnsimple.com/) to register and manage the domain `buildndeploy.com`. The beautiful font is provided by [typekit](http://typekit.com/).

	The goal of this app is to be able to make notes about various technologies and generate a web site that I can reference and quickly update and expand. The process of creating a new Markdown file should result in a new page showing up on the site.  Below are instructions for how I set up the site.
	
	## Pre-Requisites

	These instructions assume you have already installed the following:

	* [Ruby](http://www.ruby-lang.org/en/)
	* [RubyGems](http://rubygems.org/)
	* [Git](http://git-scm.com/)
	
I think you get the idea...

## Providing a Page Layout

Inside the `views` directory we'll also create `layout.erb` which all our Markdown pages will be inserted into. Here are the contents:

	<html>
	  <head>
		<title>Notes</title>
	  </head>

	  <body>
	    <p><a href="/">Home</a><% if (@topic) then %> | <a href="<%= @topic %>/source">View Markdown Source</a><% end %></p>

		<%= yield %>
	  </body>

	</html>

Pretty CSS is left as an exercise to the reader.

## The Home Page

One more file for the `views` directory. This one is named `index.erb`. We want to do a little Ruby coding and we can't do that with a Markdown file:

	<h1>My Notes</h1>

	<h2>Contents</h2>

	<ul>
	<% @topics.each do |topic| %>
	  <li><a href="/<%= topic %>"><%= topic %></a></li>
	<% end %>
	</ul>

## Giving It A Whirl

When you're done, try out your app:

	$ ruby -rubygems notes.rb

It will now be running on http://localhost:4567/ and you should see a link to your "about" page under Contents.

For more information about Sinatra check out [Getting Started with Sinatra](http://www.sinatrarb.com/intro) and the [Sinatra Documentation](http://www.sinatrarb.com/documentation).

Check the [Markdown:Syntax](http://daringfireball.net/projects/markdown/syntax) page for information on how to format your documents.

## Rack App

We're going to be using Heroku to host our application which means we need to provide a few things to help it understand our projects dependencies and how to start it up as a [Rack application](http://rack.rubyforge.org/).

First we need to create a `.gems` file which contains the Gems our project requires. We only need to tell it about Sinatra:

	sinatra

Next we need to create a `config.ru` that includes our main application file and then starts it up as a Sinatra application:

	require './notes.rb'
	run Sinatra::Application

## Git

Heroku uses Git as its version control system, so we need to set our app as a Git repository:

	git init
	git add .
	git commit -m "Initial commit"

## Heroku

You'll need to visit the [Heroku Signup](http://api.heroku.com/signup) to create an account if you don't already have one. You'll also need to set up a public SSH Key and upload it to Heroku. There are instructions for creating SSH keys on GitHub for [Mac](http://help.github.com/mac-set-up-git/), [Windows](http://help.github.com/win-set-up-git/) and [Linux](http://help.github.com/linux-set-up-git/).

Once you've done that you'll want to install the Heroku Gem

	gem install heroku

Now that we have the Gem installed we can turn our project into a Heroku app and push it to their Git repository

	heroku create
	
The first time you run this command you'll be asked for your Heroku login information to authenticate with. It will then upload the public SSH key you made for future use. Pay attention to the http URL it gives you. This will be the URL you use to access your app. You can also visit the [My Apps page on Heroky](https://api.heroku.com/myapps) to see your URLs.

Now we push our code to the Git repository Heroku set up for us:
	
	git push heroku master

If all went well you should be able to view your site at the URL Heroku provided above.

For more details about Heroku check out the [Heroku Quick Start](http://devcenter.heroku.com/articles/quickstart)

## Add Custom Domain Add-On to your Heroku App

By Default the Heroku service on DNSimple will make www.yourhost.com point to your Heroku app. In my case I want notes.buildndeploy.com to point there. www.buildndeploy.com will likely point to WordPress or a similar blogging service.

So let's use the Advanced Editor to set up the following:

	notes.buildndeploy.com -> 174.129.212.2
	notes.buildndeploy.com -> 75.101.145.87
	notes.buildndeploy.com -> 75.101.163.44

Now that the hostnames are set up, let's add the Custom Domain addon and configure it:

	$ heroku addons:add custom_domains
	$ heroku domains:add notes.buildndeploy.com
	Added notes.buildndeploy.com as a custom domain name to sharp-ocean-239.heroku.com

