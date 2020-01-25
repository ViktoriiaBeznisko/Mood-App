class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
    #validates :username, :password in the user`s model.
    #validates :username, uniqueness in the user`s model.
    user = User.new(params)
        if  user.save  
            session[:user_id] = user.id
            redirect '/users_activities/new'
        else 
            @error = "Some information is missing or account with this username already exists."
            erb :'users/signup'
        end
     end 
  
    delete 'users/:id' do
        user = User.find(params[:id])
        user.destroy
        redirect '/signup' 
    end
end