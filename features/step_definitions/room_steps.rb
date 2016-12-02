Given(/^the following rooms exist:$/) do |table|
  table.hashes.each do |room|
    Room.create!(room)
  end
end

Then(/^the room "([^"]*)" should have the color "([^"]*)"$/) do |name, color|
  expect((Room.find_by name: name).send('color'.to_sym)).to eq(color)
end

Then(/^a room with the name "([^"]*)" should exist$/) do |name|
  expect(Room.find_by name: name).to_not be_nil
end

Then(/^a room with the name "([^"]*)" should not exist$/) do |name|
  expect(Room.find_by name: name).to be_nil
end

Then(/^I should see a new popup$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^a room with name "([^"]*)" should not exist$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
