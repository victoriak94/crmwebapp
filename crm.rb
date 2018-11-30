

require_relative 'contact'
require 'sinatra'

get '/home' do
  @title = "Bitmaker CRM"
  erb :index
end

get '/contacts' do
  @title = "Bitmaker CRM"
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  # @title = @contact.first_name + "'s Info"
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
  erb :show_contact
end

get '/about_me' do
  @title = "About"
  erb :about_me
end

after do
  ActiveRecord::Base.connection.close
end
