class Message < ActiveRecord::Base
    has_many :users, through: :users_messages
    belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
    belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'
        
end