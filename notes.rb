require 'bundler/setup'
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

get '/favicon.ico' do
  404
end

get '/:topic' do
  @topic = params[:topic]
  markdown params[:topic].to_sym
end

get '/:topic/source' do
  send_file File.dirname(__FILE__) + "/views/#{params[:topic]}.md", :type => :text
end
