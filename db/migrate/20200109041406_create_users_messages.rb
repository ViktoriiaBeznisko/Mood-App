class CreateUsersMessages < ActiveRecord::Migration
  def change
    create_table :users_messages do |t|
      t.integer :user_id
      t.integer :message_id
    end
  end
end