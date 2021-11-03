require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  describe '#index' do
    it 'displays recent dogs' do
      2.times { create(:dog) }
      get :index
      expect(assigns(:dogs).size).to eq(2)
    end
  end

  describe '#edit' do
    it 'shows edit page when dog has no owner' do
      dog = create(:dog)
      get :edit, params: { id: dog.id }
      expect(assigns(:dog)).to eq(dog)
    end

    it 'shows edit page for owner that owns the dog' do
      owner = create(:user)
      dog = create(:dog, owner: owner)
      sign_in owner
      get :edit, params: { id: dog.id }
      expect(assigns(:dog)).to eq(dog)
    end

    describe 'dog with different owner' do
      let(:user) { create(:user) }
      let(:owner) { create(:user) }
      let(:dog) { create(:dog, owner: owner) }
      subject { get :edit, params: { id: dog.id } }

      it 'redirect to show when dog has owner and user is not owner' do
        sign_in user
        expect(subject).to redirect_to(dog_url(dog))
      end
    end
  end
end
