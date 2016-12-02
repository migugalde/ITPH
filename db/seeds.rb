6.times do
	client = Client.new
 	client.counselor = ['Toni', 'Bob'].sample
 	client.name = Faker::Name.name
 	client.email = "533petersave@gmail.com"
 	client.phone_number = Faker::PhoneNumber.cell_phone
 	client.save
end

users = [{:name => 'Toni', :email => 'toni@gmail.com', :password => 'password', :password_confirmation => 'password',:phone_number => '+2412412414', :admin => true},
            {:name => 'Bob', :email => 'bob@gmail.com', :password => 'password', :password_confirmation => 'password', :phone_number => '+2412412414', :admin => false}]

unless User.find_by( email: "toni@gmail.com" )
  users.each do |user|
    User.create!(user)
  end
end


rooms = [{:name => 'Room 1', :color => '#FF0000'},
				{:name => 'Room 2', :color => '#000000'},
				{:name => 'Room 3', :color => '#0000FF'}]

rooms.each do |room|
	Room.create!(room)
end

40.times do
  event = Event.new
  event.title = Faker::Book.title
  event.event_type = ["Meeting", "Group Event"].sample
  event.room = Room.all.sample
  event.notes = Faker::Hipster.paragraph
	event.start = Faker::Time.between(7.days.ago, 14.days.from_now + 7.days, :all)
  event.end = event.start + [1,2].sample.hours
  event.date = event.start.to_date
  event.save
end

Event.all.each do |event|
  if (event.event_type == "Meeting")
    event.users << [User.all.sample]
    event.clients << [Client.all.sample]
  else
    event.users << [User.all.sample(rand(1..User.count))]
    event.clients << [Client.all.sample(rand(1..Client.count))]
  end
end
