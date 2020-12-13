class ItemsController < ApplicationController
  
    post "/items" do

    end

    
    get "/items/:id" do

    end
  
    get "/items/new" do

    end



    get "/items/:id/edit" do

    end

    patch "/items/:id" do

    end

    delete "/items/:id" do
        item = Item.find_by(id: params[:id])

    end
  
  end