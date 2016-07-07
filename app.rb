require 'sinatra/base'
require 'sinatra/activerecord'
require 'tilt/erb'

class PetsApp < Sinatra::Base

set :method_override, true

get "/" do
  @dog = "Rex"
  erb :index
end

get "/about" do
  erb :about
end

get '/animals/new' do
  erb :'/animals/new'
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb :'/animals/show'
end

get '/animals' do
  @animals = Animal.all
  erb :'/animals/index'
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb :'/animals/edit'
end


post '/animals/:id' do
  animal = Animal.find(params[:id]) 
  animal.update(:name => params[:name], :species => params[:species]) 
  redirect to "/animals"
end


delete '/animals/:id' do
  animal = Animal.find(params[:id])
  animal.delete
  redirect to "/animals"
end

post '/animals' do
  Animal.create!(params)
  redirect to "/animals"
end

end


class Animal < ActiveRecord::Base
end
