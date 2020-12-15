class HobbiesController < ApplicationController
  
    get "/hobbies" do
        @hobbies = Hobby.all
        erb :"hobby/index"
    end

    get "/hobbies/new" do
        erb :"hobby/new"
    end

    post "/hobbies" do
        @hobby = Hobby.create(params)
        @hobby.user_id = session[:user_id] #look at video for better accociation
        @hobby.save
        
        erb :"hobby/show"
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
        if @hobby.user == current_user
            erb :'/hobby/edit'
        else
            redirect '/hobbies'
        end
    end

    patch "/hobbies/:id/edit" do
        #protect
        @hobby = Hobby.find_by(id: params[:id])
        @hobby.update(params[:hobby])
        redirect "/hobbies/#{@hobby.id}"
    end

    delete "/hobbies/:id" do
        @hobby = Hobby.find_by(id: params[:id])
        if @hobby.items
            @hobby.items.delete
        end
        @hobby.delete
        redirect "/hobbies"
    end
end