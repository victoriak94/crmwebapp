

require_relative 'contact'
require 'sinatra'

get '/home' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about_me' do
  erb :about_me
end

after do
  ActiveRecord::Base.connection.close
end
