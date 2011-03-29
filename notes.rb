require "sinatra"
require "rdiscount"

set :markdown, :layout_engine => :erb

get '/' do
  markdown :index
end

get '/:topic' do
  markdown params[:topic].to_sym
end
