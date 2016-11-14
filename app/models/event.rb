# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  counselor  :string
#  title      :string
#  clients    :string
#  user_id    :integer
#  client_id  :integer
#  type       :string
#  date       :string
#  room       :string
#  notes      :string
#  start      :datetime
#  end        :datetime
#  color      :string
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  validates :title, presence: true
  belongs_to  :user
  belongs_to  :client
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def self.user_events(user, e_start, e_end)
    events = Event.where(start: e_start..e_end)
    events.each do |event|
      if user == event.user then
        event.color = 'green'
      else
        event.title = event.user.name
      end
    end
    events
  end
end
