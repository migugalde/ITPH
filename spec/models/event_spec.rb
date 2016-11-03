require 'spec_helper'

describe Event do
  #calendar = Calendar.create!( name: 'Sample Calendar', color: '#ffff00')
  it "successfully creates an event" do
   event =  Event.create!( title: "Bobs event",
                           counselor: 'Anna',
                           clients: "Bob",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am')
   expect(event.valid?)
 end
 it "changes the title based on if not counselors clients" do
   event =  Event.create!( title: "Bobs event",
                           counselor: 'Anna',
                           clients: "Bob",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am')
   expect(event.valid?)
   Event.get_events("Yolanda")
   expect(event.title).to eq("Anna")
 end

  it "changes the title based on if counselors client" do
   event =  Event.create!( title: "Bobs event",
                           counselor: 'Anna',
                           clients: "Bob",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am')
   expect(event.valid?)
   Event.get_events("Anna")
   expect(event.title).to eq("Bob")
 end

 it "is not an all day event" do
   event =  Event.create!( title: "Bobs event",
                           counselor: 'Anna',
                           clients: "Bob",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am')
   expect(event.valid?)
   expect(event.all_day_event?).to be_falsy
  end

   it "shows what room is available" do
   event =  Event.create!( title: "Bobs event",
                           counselor: 'Anna',
                           clients: "Bob",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am')
   expect(event.valid?)
   expect(event.room).to eq("Room1")
  end

end
