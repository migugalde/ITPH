class Event < ActiveRecord::Base
  validates :title, presence: true

  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def self.modify_viewable_titles counselor
    Event.where(:counselor => counselor).each do
    	each.title = each.clients
    end
    Event.where.not(:counselor => counselor).each do
	each.title = each.counselor
    end
  end
end
