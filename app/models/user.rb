class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true

    has_many :invites
    has_many :events
    has_many :attended_events , :through => :invites
end
