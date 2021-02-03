require 'rails_helper'

RSpec.describe Api::V1::SurvivorsController, type: :controller do
  let!(:survivor) { create(:survivor) }
  let!(:survivor1) { create(:survivor) }
  let!(:survivor2) { create(:survivor) }

  describe '#survivor' do
    it 'GET#index' do
      get :index

      expect(response).to have_http_status(:success)
      binding.pry
    end
  end
end
