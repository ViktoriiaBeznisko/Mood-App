class UsersActivities < ActiveRecord::Migration
  def change
    create_table :users_activities do |t|
      t.string :city
      t.string :state
      t.date :date
      t.integer :user_id
      t.integer :activity_id
    end
  end
end
