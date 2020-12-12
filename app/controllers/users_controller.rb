class UsersController < ApplicationController

    get "/signup" do
        erb :"user/new"
    end

    post '/signup' do
        user = User.create(params) 
        session[:user_id] = user.id
        redirect "/hobbies"
    end
    
    get '/login' do
        erb :"user/index"
    end



end