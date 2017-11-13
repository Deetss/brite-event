module EventsHelper
  def registered?(user)
    attendees.include?(user)
  end
end
