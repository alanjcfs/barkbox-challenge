require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:dog) { create(:dog) }
  let(:user) { create(:user) }

  describe "POST #create" do
    it "returns http success" do
      sign_in user
      post :create, format: :json, params: { dog_id: dog.id }
      expect(response).to be_successful
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      sign_in user
      like = Like.create!(user_id: user.id, dog_id: dog.id)
      delete :destroy, format: :json, params: { id: like.id }
      expect(response).to be_successful
    end
  end

end
