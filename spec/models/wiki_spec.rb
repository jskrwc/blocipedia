require 'rails_helper'
include RandomData

RSpec.describe Wiki, type: :model do

  # let(:user) { create(:user) }
  # let(:wiki) { create(:wiki) }
  #
  # it { is_expected.to belong_to :user }
  #
  #
  #    describe "attributes" do
  #      it "has title and body attributes" do
  #       expect(wiki).to have_attributes(title: title, body: body)
  #       expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, private: wiki.private)
  #      end
  #    end


   let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: false, user: :user) }

     describe "attributes" do
       it "has title, body, privacy, and user attributes" do
         expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: false, user: :user)
       end
     end





end
