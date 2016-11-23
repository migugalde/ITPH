class Room < ActiveRecord::Base
  validates :title, presence: true
  validates :color, presence: true
  has many :events
end
