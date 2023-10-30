require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  
  describe 'GET /index' do
    before do
      get user_posts_path(user_id: 1)
    end

    it 'returns correct status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/index')
    end

    it 'returns the correct placeholder text' do
      expect(response.body).to include('Posts List or here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before do
      get user_post_path(user_id: 1, id: 1)
    end

    it 'returns correct status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end

    it 'returns the correct placeholder' do
      expect(response.body).to include('Individual Posts Details')
    end
  end
  
 
end

