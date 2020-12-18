class HobbiesController < ApplicationController
  
    get "/hobbies" do
        @hobbies = Hobby.all

        erb :"hobby/index"
    end

    get "/hobbies/new" do
        if logged_in?
            
            erb :"hobby/new"
        else
            redirect '/login'
        end
    end

    post "/hobbies" do
        @hobby = Hobby.new(params)
        if logged_in? && @hobby.user == current_user
            if @hobby.save

                erb :"hobby/show"
            end
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
            if @hobby.update(params[:hobby])
                
                redirect "/hobbies/#{@hobby.id}"
            else
                @error = @hobby.errors.full_messages.first

                erb :"hobby/edit"
            end
        else
            redirect "/login"
        end
    end

    delete "/hobbies/:id" do
        hobby = Hobby.find_by(id: params[:id])
        if logged_in? && hobby.user == current_user
            if hobby.items
                hobby.items.destroy
            end
            hobby.destroy

            redirect "/hobbies"
        else
            redirect "/login"
        end
    end
end