class HobbiesController < ApplicationController
  
    get "/hobbies" do
        @hobbies = Hobby.all
        erb :"hobby/index"
    end

    # get "/hobbies/new" do

    # end

    # post "/hobbies" do
    #     hobby
    # end

    get "/hobbies/:id" do
        @hobby = Hobby.find_by(id: params[:id])
        if @hobby
            erb :'hobby/show'
        else
            redirect "/hobbies"
        end
    end

    # get "/hobbies/:id/edit" do
    #     @hobby = Hobby.find_by(id: params[:id])
    #     if @hobby.user == current_user
    #         erb :'/hobbies/edit'
    #     else
    #         redirect '/hobbies'
    #     end
    # end

    # patch "/hobbies/:id" do
    #     @hobby = Hobby.find_by(id: params[:id])
    #     @hobby.update(params)
    #     redirect "/hobbies/#{@hobby.id}"
    # end

    # delete "/hobbies/:id" do
    #     @hobby = Hobby.find_by(id: params[:id])
    #     @hobby.delete
    #     redirect "/hobbies/#{@hobby.id}
    # end

end