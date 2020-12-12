class ItemsController < ApplicationController
  
    get "/item" do
        erb:"item/index"
    end

    get "/item/:id" do

    end
  
    get "/item/new" do

    end

    post "/item" do

    end

    get "/item/:id/edit" do

    end

    patch "/item/:id" do

    end

    delete "/item/:id" do

    end
  
  end