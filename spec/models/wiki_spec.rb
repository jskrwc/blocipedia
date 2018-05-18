require 'rails_helper'
include RandomData

RSpec.describe Wiki, type: :model do

  let(:user) { create(:user) }
  #let(:admin_user) { create(:user, role: 'admin') }
  let(:wiki) { create(:wiki, user: user) }
  #
  it { is_expected.to belong_to :user }

   #let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user) }

     describe "attributes" do
       it "has title, body, privacy, and user attributes" do
         expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, private: wiki.private, user: user)
         # expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user)
       end
     end





end
