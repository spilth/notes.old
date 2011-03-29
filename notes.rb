require "sinatra"
require "rdiscount"
require "erb"

set :markdown, :layout_engine => :erb
set :erb, :layout => "text"

get '/' do
  markdown :index
end

get '/:topic' do
  markdown params[:topic].to_sym
end

get '/:topic/markdown' do
  erb params[:topic].to_sym
end
