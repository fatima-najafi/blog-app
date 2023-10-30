require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before do
      get users_path
    end

    it 'returns correct status' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end

    it 'returns the correct placeholder text' do
      expect(response.body).to include('Users List')
    end
  end

  describe 'GET /show' do
    before do
      get '/users/1'
    end

    it 'returns correct status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/show')
    end

    it 'returns the correct placeholder' do
      expect(response.body).to include('Individual Users Details')
    end
  end
end
