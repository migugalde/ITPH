# == Schema Information
#
# Table name: clients
#
#  id           :integer          not null, primary key
#  name         :string
#  counselor    :string
#  email        :string
#  phone_number :string
#  created_at   :datetime
#  updated_at   :datetime
#

class Client < ActiveRecord::Base
  has_and_belongs_to_many :events, :uniq => true
end
