require 'sinatra/base'
require 'sinatra/activerecord'
require 'tilt/erb'

class PetsApp < Sinatra::Base

get "/" do
  @dog = "Rex"
  erb :index
end

get "/about" do
  erb :about
end

end
