FactoryBot.define do
  factory :wiki do
    title RandomData.random_sentence
    body RandomData.random_paragraph
    private false
    # user
    association :user, factory: :user  #factory create user was throwing error, so associate

  end
end
