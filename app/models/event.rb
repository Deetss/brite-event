class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    has_many :invites
    has_many :attendees, through: :invites
    
        
    scope :past, -> { where("date < ?", Time.zone.now) }
    scope :upcoming, -> { where("date >= ?", Time.zone.now) }

    def date
        super.strftime("%B %e @ %l:%M") unless super.nil?
    end
end
