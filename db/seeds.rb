# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create name: 'Max', location: '10007', gender: 1, seeking: 0, password: 'max', password_confirmation: 'max', email: 'max@max.com'
User.create name: 'Stacey', location: '10007', gender: 0, seeking: 1, password: 'max', password_confirmation: 'max', email: 'stacey@max.com'
User.create name: 'Jon', location: '10007', gender: 1, seeking: 0, password: 'max', password_confirmation: 'max', email: 'jon@max.com'
User.create name: 'Jill', location: '10013', gender: 0, seeking: 1, password: 'max', password_confirmation: 'max', email: 'jill@max.com'

Like.create userA_id: User.find(2).id, userB_id: User.find(1).id
Like.create userA_id: User.find(1).id, userB_id: User.find(2).id
Like.create userA_id: User.find(3).id, userB_id: User.find(1).id
Like.create userA_id: User.find(1).id, userB_id: User.find(3).id


Message.create userA_id: User.find(1).id, userB_id: User.find(2).id, data: 'Heyo'
Message.create userA_id: User.find(2).id, userB_id: User.find(1).id, data: 'LOL'
Message.create userA_id: User.find(1).id, userB_id: User.find(2).id, data: 'RWAR'
Message.create userA_id: User.find(3).id, userB_id: User.find(1).id, data: 'Heyo'
Message.create userA_id: User.find(1).id, userB_id: User.find(3).id, data: 'LOL'
Message.create userA_id: User.find(3).id, userB_id: User.find(1).id, data: 'RWAR'
