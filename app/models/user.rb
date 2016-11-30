class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable
  has_and_belongs_to_many :events, :uniq => true
  validates :name, presence: true
  validates :email, presence: true
end
