class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"

    def date
        super.strftime("%B %e") unless super.nil?
    end

    def time
        super.strftime("@ %l:%M") unless super.nil?
    end
end
