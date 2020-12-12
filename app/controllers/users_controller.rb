class UsersController < ApplicationController

    get "/signup" do
        erb :"user/new"
    end

    post '/signup' do
        user = User.new(params)
        if  user.save
            session[:user_id] = user.id
            redirect "/hobbies" 
        else
            # binding.pry 
            @errors = user.errors.full_messages.join(" - ")
            erb :"user/new"
        end
    end
    
    get '/login' do
        erb :"user/index"
    end



end