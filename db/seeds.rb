# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'
require 'faker'

  # Create Users
  5.times do
    User.create!(
      :email => Faker::Internet.email,
      :password => Faker::Internet.password
    )
  end
  users = User.all


 # Create Wikis

# create a test user with 20 wikis
User.create(email: 'test@example.com', password: 'password')

 20.times do
 # create with bang -- ! raises error if problem w/ data we're seeding
   wiki = Wiki.create!(
     user:  users.sample,
     :title => Faker::MostInterestingManInTheWorld.quote,
     :body => Faker::Lorem.paragraph,
     private: false
   )

   # update the time wiki created
   wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)


 end
 wikis = Wiki.all


# # # add me as user for test purposes
# # user = User.first
# # user.update_attributes!(
# #   email: 'jim@knopf.io',
# #   password: 'password'
# # )
#
# # Create  admin user
# admin = User.create!(
#   email:  'admin@example.com',
#   password: 'password',
#   role: 'admin'
# )
#
# # Create a standard user
# standard = User.create!(
#   email: 'standard@example.com',
#   password: 'password'
#   role: 'standard'
# )
#
# # Create a premium user
# standard = User.create!(
#   email: 'premium@example.com',
#   password: 'password'
#   role: 'premium'
# )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
