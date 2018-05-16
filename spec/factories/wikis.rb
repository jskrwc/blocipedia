FactoryBot.define do
  factory :wiki do
    title RandomData.random_sentence
    body RandomData.random_paragraph
    private false
    user
    # user create(:user)




    # title "MyWiki Title"
    # body "This is the Wiki body for MyWiki"
    # private false
    # # user "admin@example.com"
    # user nil
  end
end
