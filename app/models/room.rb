class Room < ActiveRecord::Base
  validates :name, presence: { message: "Must enter room name." }, uniqueness: { message: "Room already exists."}, length: { in: 1..20, message: "Room name must be between 1 and 20 character" }
  validates :color, presence: true, format: { with: /\A#(?:[0-9a-zA-Z]{3}|[0-9a-zA-Z]{6})\z/,
    message: 'Only permits 3 or 6 digit CSS codes'}

  COLORS = {
    green:       '#7bd148',
    bold_blue:   '#5484ed',
    blue:        '#a4bdfc',
    turquoise:   '#46d6db',
    light_green: '#7ae7bf',
    bold_green:  '#51b749',
    yellow:      '#fbd75b',
    orange:      '#ffb878',
    red:         '#ff887c',
    bold_red:    '#dc2127',
    purple:      '#dbadff',
    gray:        '#e1e1e1'
  }.freeze

  def self.colors
    COLORS
  end

  def self.default_color
    COLORS[:green]
  end
end
