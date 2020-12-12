class UsersController < ApplicationController

    get '/login' do
        erb :"user/index"
    end

end