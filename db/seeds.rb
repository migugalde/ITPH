6.times do
	client = Client.new
	client.counselor = ['Toni', 'Bob'].sample
	client.name = Faker::Name.name
	client.email = Faker::Internet.email(client.name)
	client.phone_number = Faker::PhoneNumber.cell_phone
	client.save
end

users = [{:email => 'toni@gmail.com', :password => 'toni', :phone_number => '+2412412414'},
            {:email => 'bob@gmail.com', :password => 'bob', :phone_number => '+2412412414'},
						{:email => 'jeff@gmail.com', :password => 'jeff', :phone_number => '+2412412414'}]


users.each do |user|
   User.create!(user)
 end

20.times do
  event = Event.new
  event.title = Faker::Book.title
	event.user = [User.find(1),User.find(2)].sample
	event.client_id = [1,2,3,4,5,6].sample
  event.start = Faker::Time.between(14.days.ago, Date.today + 7.days, :morning)
  event.end = Faker::Time.between(event.start, event.start + 1.hour, :evening)
  event.color = ['blue','black','red'].sample
  event.save
end
