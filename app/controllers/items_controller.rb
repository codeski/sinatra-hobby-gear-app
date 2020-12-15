class ItemsController < ApplicationController
    
    post "/items" do
        @item = Item.create(params)
        @hobby = Hobby.find_by(id: @item.hobby_id)  

        erb :'hobby/show'
    end

    get "/items/:id" do 
        @item = Item.find_by(id: params[:id])
        @hobby = Hobby.find_by(id: @item.hobby_id)

        erb :'hobby/show'
    end

    get "/items/:id/edit" do
        @item = Item.find_by(id: params[:id])
        erb :'item/edit'
    end

    patch "/items/:id" do
        @item = Item.find_by(id: params[:id])
        @item.update(params[:item])
        # @hobby = Hobby.find_by(id: @item.hobby_id) 
        @item.hobby

        # erb :'hobby/show'
        redirect "/items/#{@item.id}"
    end

    delete "/items/:id" do
        @item = Item.find_by(id: params[:id])
        @hobby = Hobby.find_by(id: @item.hobby_id)
        @item.delete

        erb :'hobby/show'
        # redirect "/items/#{@item.id}"
    end
  end