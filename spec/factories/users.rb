FactoryBot.define do
   pw = RandomData.random_sentence

   factory :user do

     email RandomData.random_email
     password pw
     password_confirmation pw
     # role :member
   end
 end
