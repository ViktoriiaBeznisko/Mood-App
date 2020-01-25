class DeleteStateFromUsersActivities < ActiveRecord::Migration
  def change
    remove_column :users_activities, :state
  end
end
