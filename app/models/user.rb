class User < ActiveRecord::Base
    has_secure_password
    validates :username, :password, presence: true
    validates :username, uniqueness: true
    
    has_many :users_activities
    has_many :activities, through: :users_activities

    has_many :users_messages
    has_many :messages, through: :users_messages

    # belongs_to :sent_messages, :class_name => Message, :foreign_key => 'sender_id'
    # belongs_to :received_messages, :class_name => Message, :foreign_key => 'recipient'

    # has_many :recivied_messages, :class_name => Message, :foreign_key => 'recipient'
    # has_many :send_messages, :class_name => Message, :foreign_key => 'sender'
end
