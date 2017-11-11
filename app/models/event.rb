class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    has_many :invites
    has_many :attendees, through: :invites

    def date
        super.strftime("%B %e") unless super.nil?
    end

    def time
        super.strftime("@ %l:%M") unless super.nil?
    end
end
