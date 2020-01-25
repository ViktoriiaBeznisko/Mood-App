class SessionsController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Some information is missing. Please enter your Username / Password."
            erb :'users/login'
        else 
            user = User.find_by(:username => params[:username])
            if user && user.authenticate(params[:password])
              session[:user_id] = user.id
                redirect '/users_activities'
            else
                @error = "Account not found."
                erb :'users/login'
            end
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end
               
