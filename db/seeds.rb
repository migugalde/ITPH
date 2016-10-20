# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
clients = [{:name => 'Aladdin', :counselor => 'Toni', :email => 'a@gmail.com', :phone_number => "999-000-1929"},
	{:name => 'Dame Edwards', :counselor => 'Yolanda', :email => 'dameean@gmail.com', :phone_number => "999-111-1929"},
  	 ]

clients.each do |client|
  Client.create!(client)
end

counselors = [{:name => 'Toni', :username => 'toni@itph.com', :password => 'toni123'},
            {:name => 'Yolanda', :username => 'yolanda@itph.com', :password => 'nottoni123'}]

#counselors.each do |counselor|
#    Counselor.create!(counselor) #commented out by hannah tran because counselor controller does not exist in this commit
#end
