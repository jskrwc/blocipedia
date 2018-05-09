# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'

  # # Create Users
  # 5.times do
  #   User.create!(
  #     name:     RandomData.random_name,
  #     email:    RandomData.random_email,
  #     password: RandomData.random_sentence
  #   )
  # end
  # users = User.all


 # Create Wikis

# create a test user with 20 wikis
User.create(email: 'test@example.com', password: 'password')

 20.times do
 # create with bang -- ! raises error if problem w/ data we're seeding
   wiki = Wiki.create!(
     user:  User.first,
     title: RandomData.random_sentence,
     body:  RandomData.random_paragraph
   )

   # update the time wiki created
   wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)


 end
 wikis = Wiki.all


# # # add me as user for test purposes
# # user = User.first
# # user.update_attributes!(
# #   email: 'jim@knopf.io',
# #   password: 'helloworld'
# # )
#
# # Create and admin user
# admin = User.create!(
#   name: 'Admin User',
#   email:  'admin@example.com',
#   password: 'helloworld',
#   role: 'admin'
# )
#
# # Create a member
# member = User.create!(
#   name: 'Member User',
#   email: 'member@example.com',
#   password: 'helloworld'
# )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
