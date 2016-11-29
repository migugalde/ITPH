class Room < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 1..20 }
  validates :color, presence: true, format: { with: /\A#(?:[0-9a-zA-Z]{3}|[0-9a-zA-Z]{6})\z/,
    message: 'Only permits 3 or 6 digit CSS codes'}
end
