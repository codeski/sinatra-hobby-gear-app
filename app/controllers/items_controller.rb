class ItemsController < ApplicationController
    
    post "/items" do
        item = Item.new(params)
        if logged_in? && item.hobby.user == current_user
            if item.save 
                @hobby = item.hobby  

                erb :'hobby/show'
            else
                @hobby = item.hobby
                @itemerror = item.errors.full_messages.first
                # binding.pry
                erb :'hobby/show'
            end
        else
            redirect '/hobbies'
        end
    end

    get "/items/:id" do 
        @item = Item.find_by(id: params[:id])
        if @item
            @hobby = @item.hobby

            erb :'hobby/show'
        else
            redirect "/hobbies"
        end
    end

    get "/items/:id/edit" do
        @item = Item.find_by(id: params[:id])
        if logged_in? && @item.hobby.user == current_user
            erb :'item/edit'
        else
            redirect "/hobbies"
        end
    end

    patch "/items/:id" do
        item = Item.find_by(id: params[:id])
        item.update(params[:item])
        # @hobby = Hobby.find_by(id: @item.hobby_id) 
        # item.hobby

        # erb :'hobby/show'
        redirect "/items/#{item.id}"
    end

    delete "/items/:id" do
        item = Item.find_by(id: params[:id])
        @hobby = item.hobby
        item.delete

        erb :'hobby/show'
        # redirect "/items/#{@item.id}"
    end
  end