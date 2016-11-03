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

users = [{:email => 'test1@gmail.com', :password => 'test1'},
            {:email => 'test2@gmail.com', :password => 'test2'}]

users.each do |user|
   User.create!(user)
 end

 6.times do
  event = Event.new
  event.title = Faker::Book.title
  start = Faker::Time.between(7.days.ago, Date.today + 7.days, :morning)
  event.start = start
  event.end = Faker::Time.between(start, start + 2.days, :evening)
	event.color = ['blue','red'].sample
	event.user_id = [1,2].sample
  event.save
end
