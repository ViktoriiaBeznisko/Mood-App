class MessagesController < ApplicationController
    before do
        require_login
    end

    get '/messages/new' do
        @new_message = current_user.messages.build(params)
        @users = User.joins(:u_activity["date"], :u_activity["city"], :u_activity["activity_id"]).uniq
        erb :'messages/new'
    end

    post '/messages/new' do
        @new_message = current_user.messages.build(params)
        if @new_message.save
            redirect '/messages'
        else 
            @error = "Please select a person."
            erb :'messages/new'
        end 
    end
    
    get '/messages' do
        @user = User.find_by(id: session[:user_id])
        @sent = Message.where(sender_id: @user.id)
        @received = Message.where(recipient_id: @user.id)
        # @recipient = User.where(:recipient_id)
        erb :'messages/index'
    end   
end