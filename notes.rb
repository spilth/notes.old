require "sinatra"
require "rdiscount"

set :markdown, :layout_engine => :erb

get '/' do
  markdown :index
end

get '/site' do
  markdown :site
end
