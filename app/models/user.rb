class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable
  has_and_belongs_to_many :events, :uniq => true
  has_many :clients
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => Devise::email_regexp
end
