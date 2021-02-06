require 'rails_helper'

RSpec.describe Api::V1::SurvivorsController, type: :controller do
  let!(:survivor) { create(:survivor) }
  let!(:survivor1) { create(:survivor) }
  let!(:survivor2) { create(:survivor) }


  describe 'POST#create' do
    context 'with valid params' do
      let(:valid_params) do 
        { name: 'Daniel', 
          age: 25, 
          gender: 'Male'} 
      end
      
      it 'returns http success' do
        post :create, params: valid_params
        expect(response).to have_http_status(:success)
      end
    
      it 'increase survivors by one' do
        post :create, params: valid_params
        expect(Survivor.last).to have_attributes valid_params 
      end
    end
  end


  describe 'GET#show' do
    before { get :show, params: { id: survivor.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'response containing expected survivor' do
      @test_survivor = Survivor.find_by(id: JSON.parse(response.body)['id'])
      expect(@test_survivor).to eql(survivor)
    end
  end

  describe 'GET#index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'expect to 3 survivors' do
      expect(JSON.parse(response.body).length).to eql(3)
    end
  end
end

