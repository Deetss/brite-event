class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    has_many :invites
    has_many :attendees, through: :invites
    
    scope :upcoming, -> { where("date > ?", Time.zone.now) }
        
    scope :past, -> { where("date <= ?", Time.zone.now) }
    
    

    def formated_datetime
        date.strftime("%B %e") + time.strftime(" @ %l:%M %P") unless date.nil?
    end
end
