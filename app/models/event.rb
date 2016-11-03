class Event < ActiveRecord::Base
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def self.get_events(id)
  	events = Event.where(start: params[:start]..params[:end])
  	events.each do |event|
  		if event.counselor == User.find(id)
  			event.title = event.client
  			event.colorBorder = 0xFF
  		else
  			event.title = event.counsellor
  		end
  	end
  end
end