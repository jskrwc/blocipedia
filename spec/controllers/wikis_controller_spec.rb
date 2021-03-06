require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do

  let(:wiki) {create(:wiki) }
  # let(:user) {create(:user) }



  # let (:wiki) { Wiki.create!(title:RandomData.random_sentence, body:RandomData.random_paragraph, private:false) }
  #
  before do
    sign_in wiki.user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: wiki.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: wiki.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update, params: { id: wiki.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, params: { id: wiki.id }
      expect(response).to have_http_status(:success)
    end
  end

end
