class User < ActiveRecord::Base
    has_secure_password
    validates :username, :password, presence: true
    validates :username, uniqueness: true
    
    has_many :users_activities
    has_many :activities, through: :users_activities

    has_many :users_messages
    has_many :messages, through: :users_messages
end
