# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
User.create!(name:  "Exampleew User",
             email: "exampleee@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

1000000.times do |n|
  name  = Faker::Name.name
  email = "example2-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
=end

users = User.order(:created_at).take(100)
5.times do
  name = Faker::Name.name
  users.each { |user| user.animals.create!(name: name) }
end

animals= Animal.order(:created_at).take(100)
10.times do
  count = rand * (100-1) + 1
  animals.each { |animal| animal.animal_foods.create!(count: count,time: Time.zone.now)}
end