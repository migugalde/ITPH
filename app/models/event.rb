class Event < ActiveRecord::Base
  validates :title, presence: true
  belongs_to  :user
  belongs_to  :client
  attr_accessor :date_range, :color, :user_id

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def self.user_events(user_id, e_start, e_end)
    events = Event.where(start: e_start..e_end)
    events.each do |event|
      if user_id == event.user.id then
        event.color = 'green'
      end
    end
    return events
  end
end
