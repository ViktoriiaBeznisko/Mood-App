class UsersActivity < ActiveRecord::Base
    validates :date, presence: true
    validates :city, presence: true
    belongs_to :user
    belongs_to :activity
end
