class ItemsController < ApplicationController
    
    post "/items" do
        @item = Item.create(params)
        @hobby = Hobby.find_by(id: @item.hobby_id)  

        erb :'hobby/show'
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
        # item = Item.find_by(id: params[:id])

    end
  
  end