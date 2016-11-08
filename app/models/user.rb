# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  password_hash :string
#  password_salt :string
#  phone_number  :string
#  admin         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  has_many  :events
  attr_accessor :password
  before_save :encrypt_password

  validates :password, confirmation: true
  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
