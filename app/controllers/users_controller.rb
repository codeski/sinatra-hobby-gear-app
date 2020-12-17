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
            @errors = user.errors.full_messages

            erb :"user/new"
        end
    end
    
    get '/login' do
        if !logged_in?
            erb :"user/login"
        else
            redirect "/hobbies"
        end
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect "/hobbies"
        else
            @error = "Wrong Email and/or Password"

            erb :'user/login'
        end 
    end

    get '/logout' do
        session.clear
        
        redirect 'login'
    end
end