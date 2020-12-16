class HobbiesController < ApplicationController
  
    get "/hobbies" do
        @hobbies = Hobby.all
        erb :"hobby/index"
    end

    get "/hobbies/new" do
        erb :"hobby/new"
    end

    post "/hobbies" do
        @hobby = Hobby.new(params)
        @hobby.user = current_user
        if @hobby.save
            @hobby.save
        
            erb :"hobby/show"
        else
            @error = @hobby.errors.full_messages.first
            erb :"hobby/new"
        end

    end

    get "/hobbies/:id" do
        @hobby = Hobby.find_by(id: params[:id])
        if @hobby
            erb :'hobby/show'
        else
            redirect "/hobbies"
        end
    end

    get "/hobbies/:id/edit" do
        @hobby = Hobby.find_by(id: params[:id])
        if logged_in? && @hobby.user == current_user
            erb :'/hobby/edit'
        else
            redirect '/hobbies'
        end
    end

    patch "/hobbies/:id/edit" do
        @hobby = Hobby.find_by(id: params[:id])
        if logged_in? && @hobby.user == current_user
            if !params[:hobby][:name].empty?
                @hobby.update(params[:hobby])
                redirect "/hobbies/#{@hobby.id}"
            else
                @error = "Hobby needs a Name"
                erb :"hobby/edit"
            end
        else
            redirect "/login"
        end
    end

    delete "/hobbies/:id" do
        @hobby = Hobby.find_by(id: params[:id])
        if logged_in? && @hobby.user == current_user
            if @hobby.items
                @hobby.items.delete
            end
            @hobby.delete
            redirect "/hobbies"
        else
            redirect "/login"
        end
    end
end