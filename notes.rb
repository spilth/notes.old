require 'bundler/setup'
require 'sinatra'
require 'rdiscount'
require 'erb'
require 'builder'

set :markdown, :layout_engine => :erb

helpers do
  def getTopics()
    @topics = nil

     Dir.chdir(File.dirname(__FILE__) + "/views/") do
       @topics = Dir.glob("*.md")
     end

     @topics.reject! {|entry| entry == "index.md"}
     @topics.collect! {|entry| entry.split(".")[0]}
     @topics.sort!
  end
end

get '/' do
  @topics = getTopics
  
  erb :index
end

get '/rss' do
 @topics = getTopics
  
  builder do |xml|
    xml.instruct! :xml, :version => '1.0'
    xml.rss :version => "2.0" do
      xml.channel do
        xml.title "Build & Deploy Notes"
        xml.description "Build & Deploy Development Notes"
        xml.link "http://notes.buildndeploy.com/"

        @topics.each do |topic|
          xml.item do
            xml.title topic
            xml.link "http://notes.buildndeploy.com/#{topic}"
            xml.description "My notes about #{topic}"
            xml.pubDate Time.now.rfc822()
            xml.guid "http://notes.buildndeploy.com/#{topic}"
          end
        end
      end
    end
  end
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


