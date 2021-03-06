require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'secretofsecret' #an encryption key that will be used to create a session_id. A session_id is a string of letters and numbers that is unique to a given user's session and is stored in the browser cookie. 
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id:session[:user_id])
  end
    
  def require_login
    unless logged_in?
      redirect '/login'
    end
  end
end
