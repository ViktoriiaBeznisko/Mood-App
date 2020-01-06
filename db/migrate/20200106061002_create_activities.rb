class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.integer :user_id
      t.integer :group_id
    end
  end
end
