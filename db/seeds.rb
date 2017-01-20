users = [{:name => 'Toni', :email => 'toni@itph.org', :password => 'password', :password_confirmation => 'password', :admin => true}]

users.each do |user|
  User.create!(user)
end


rooms = [{:name => 'Tonis Room', :color => '#a4bdfc'},
				{:name => 'Middle Room', :color => '#ffb878'},
				{:name => 'First Room', :color => '#dbadff'},
        {:name => 'Waiting Room', :color => '#800000'}]

rooms.each do |room|
	Room.create!(room)
end
