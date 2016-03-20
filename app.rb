require 'sinatra'

set :port, 8000
set :bind, '45.55.18.164'


get "/" do
  @dog = "Rex"
  erb :index
end

get "/about" do
  erb :about
end

