class ApartmentsController < ApplicationController
  # add controller methods
  
  set :views, "app/views/apartments"
  
  #List all apartments
  get '/apartments' do  
    @apartments = Apartment.all
    erb :index
  end
  
  # Create a new apartment
  get '/apartments/new' do 
    erb :new
  end

  post '/apartments' do 
    apartment = Apartment.create(address: params[:address])
    redirect "/apartments/#{apartment.id}"
  end

  # Show a specific apartment
  get '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    erb :show
  end
  
  # Edit an apartment
  get '/apartments/:id/edit' do
    @apartment = Apartment.find(params[:id])
    erb :edit
  end

  patch '/apartments/:id' do
    apartment = Apartment.find(params[:id])
    apartment.update(address: params[:address])

    redirect "/apartments/#{apartment.id}"
  end

  delete '/apartments/:id' do 
    apartment = Apartment.find(params[:id])
    apartment.destroy
    redirect "/apartments"
  end

  # delete an apartment

end
