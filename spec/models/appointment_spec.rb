require 'rails_helper'

describe Event do
  #calendar = Calendar.create!( name: 'Sample Calendar', color: '#ffff00')
  it "successfully creates an event" do
   event =  Event.create!( title: "Title of Event",
                           counselor: 'Yolanda',
                           clients: "Sam",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am',
                           repetition: None)
   expect(event.valid?)
 end
 it "make sure the client and counselor id exists" do
   event =  Event.create!( title: "Title of Event",
                           counselor: 'Yolanda',
                           clients: "Sam",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am',
                           repetition: None)
   expect(event.valid?)
   expect(event.(client_id).valid?) 
   expect(event.(counselor_id).valid?)
 end
  it "make sure the client and counselor id exists" do
   event =  Event.create!( title: "Title of Event",
                           counselor: 'Yolanda',
                           clients: "Sam",
                           room: "Room1",
                           notes: '',
                           start: '2013-07-17 09:00am',
                           end: '2013-07-17 10:00am',
                           repetition: None)
   expect(event.valid?)
   expect(event.(client_id).to eq(Sam.client_id)) 
   expect(event.(counselor_id).to eq(Yolonda.client_id))
 end