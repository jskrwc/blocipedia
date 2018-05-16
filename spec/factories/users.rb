FactoryBot.define do
   pw = RandomData.random_sentence
 #
   factory :user do
 # use sequence to generate unique email address for each user
     sequence(:email){|n| "user#{n}@factory.com" }
     password pw
     password_confirmation pw
     # role :member
   end
 end
