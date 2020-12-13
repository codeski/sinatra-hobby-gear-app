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
            @errors = user.errors.full_messages
            erb :"user/new"
        end
    end
    
    get '/login' do
        erb :"user/login"
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/hobbies"
        else
            redirect "/login"
        end 
    end


    get '/logout' do
        session.clear
        redirect 'login'
    end



end