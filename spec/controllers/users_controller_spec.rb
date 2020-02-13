# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response for logged user' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
    it 'redirects if user is signed_out' do
      sign_out :user
      get :index, params: {}, session: nil
      expect(response).to have_http_status(302)
    end
  end
  describe 'GET Biography' do
    it 'returns success if logged in' do
      get :show, params: {}, session: valid_session
      expect(response).to be_successful
    end
    it 'redirects if logged out' do
      sign_out :user
      get :show, params: {}, session: valid_session
      expect(response).to have_http_status(302)
    end
  end
end
