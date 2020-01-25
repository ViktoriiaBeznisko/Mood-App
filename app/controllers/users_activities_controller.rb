class UsersActivitiesController < ApplicationController
    
    before do
        require_login
    end
   
    get '/users_activities' do 
        @list_of_activities = current_user.users_activities 
        erb :'users_activities/index'
    end  

    get '/users_activities/new'do
        @activities = Activity.all
        @list_of_cities= CS.cities(:ny, :us)
        erb :'users_activities/new'
    end
   
    post '/users_activities/new' do
    # validates :city :date in activity model
        u_activity = current_user.users_activities.build(params)
        if u_activity.save
            redirect '/users_activities'
        else 
            @error = "Some information is missing. Please choose activity and select the day."
            erb :'users_activities/new'
        end 
    end

    get '/users_activities/:id' do
        @activity = UsersActivity.find_by(id: params[:id])
        if @activity
            erb :'users_activities'
        else 
            redirect '/users_activities/new'
        end
    end 

    get '/join_activities/:id' do
        @u_activity = UsersActivity.find_by(id: params[:id])
        @join_activities = UsersActivity.where(activity_id: @u_activity.activity_id, city: @u_activity.city, date: @u_activity.date)

        erb :'users_activities/show'
     end
 
    get '/users_activities/:id/edit' do
        @my_activity = UsersActivity.find(params[:id])
        @list_of_cities= CS.cities(:ny, :us)
        erb :'/users_activities/edit'
    end

    patch '/users_activities/:id' do 
        @my_activity = UsersActivity.find(params[:id])
            if !params["users_activity"]["date"].empty? && !params["users_activity"]["city"].empty? 
            @my_activity.update(params["users_activity"])
            redirect '/users_activities'
        else
            @error = "Please select the day."
            erb :'/users_activities/edit'
        end
    end

    delete '/users_activities/:id' do
        @my_activity = UsersActivity.find(params[:id])
        @my_activity.destroy
        redirect '/users_activities' 
    end   
end