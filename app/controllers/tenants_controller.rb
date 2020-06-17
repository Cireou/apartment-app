require 'pry'
class TenantsController < ApplicationController
  # add controller methods

  set :views, "app/views/tenants"

  get '/tenants' do  
    @tenants = Tenant.all
    erb :index
  end
  
  # Create a new apartment
  get '/tenants/new' do 
    erb :new
  end

  post '/tenants' do 
    tenant = Tenant.create(name: params[:name])
    redirect "/tenants"
  end

  # Show a specific tenant
  get '/tenants/:id' do
    @tenant = find_tenant()
    erb :show
  end 

  #edit a tenant
  get '/tenants/:id/edit' do 
    @tenant = find_tenant()
    @apartments = Apartment.all()
    erb :edit
  end

  patch '/tenants/:id' do 
    tenant = find_tenant()
    tenant.update(
      name: params[:name], 
      apartment_id: params["tenant"]["apt_id"])
    redirect "/tenants/#{tenant.id}"
  end

  #delete a tenant 
  delete '/tenants/:id' do
    Tenant.delete(params[:id])
    redirect "/tenants"    
  end

  def find_tenant
    Tenant.find(params[:id])
  end
end
