# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  counselor  :string
#  title      :string
#  clients    :string
#  user_id    :integer
#  client_id  :integer
#  type       :string
#  date       :string
#  room       :string
#  notes      :string
#  start      :datetime
#  end        :datetime
#  color      :string
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Event do
   user = User.create!(email: "annassss@fso9922.com",
                        password: "anna1",
			name: "Anna");
   client = Client.create!(name: "Bob",
                              counselor: "Anna",
                              email: "bob@max.com");
   event =  Event.create!( title: "Bobs event",
                           user: user,
                           client: client,
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am');

  #calendar = Calendar.create!( name: 'Sample Calendar', color: '#ffff00')
  it "successfully creates an event" do
   expect(event.valid?)
 end
 it "changes the title based on if not counselors clients" do
   user = User.create!(email: "yolo11@gmail.com",
                        password: "anna1",
			name: "Yolo");
   expect(event.valid?)
   events = Event.user_events(2, event.start, event.end)
   expect(events[0].title).to eq("Anna")
 end

  it "changes the title based on if counselors client" do
   expect(event.valid?)
   events = Event.user_events(1, event.start, event.end)
   expect(events[0].title).to eq("Bobs event")
 end

 it "is not an all day event" do
   expect(event.valid?)
   expect(event.all_day_event?).to be_falsy
  end

it "shows what room is available" do
   expect(event.valid?)
   expect(event.room).to eq("Room1")
  end

end
