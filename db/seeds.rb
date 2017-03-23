# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Jon", last_name: "Ben", email: "jonbenstent@gmail.com", location: "Chicago", state: "IL", password: "password")
User.create(first_name: "Test", last_name: "Ben", email: "test@gmail.com", location: "Chicago", state: "IL", password: "password")
User.create(first_name: "Test1", last_name: "Ben", email: "test1@gmail.com", location: "Washington", state: "DC", password: "password")
User.create(first_name: "Test2", last_name: "Ben", email: "test2@gmail.com", location: "Oregon", state: "OR", password: "password")
User.create(first_name: "Jon", last_name: "Ben", email: "jonbenstent@gmail.com", location: "Chicago", state: "IL", password: "password")

Rsvp.create(attendee_id: User.find(3).id, event_id: Event.find(3).id)
Rsvp.create(attendee_id: User.find(2).id, event_id: Event.find(2).id)
Rsvp.create(attendee_id: User.find(1).id, event_id: Event.find(1).id)

Comment.create(content: "YES!", user_id: 1, event_id: 19)
