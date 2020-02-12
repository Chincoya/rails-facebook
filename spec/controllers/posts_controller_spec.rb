# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user
  let(:valid_session) { {} }

  describe 'When a user is logged in' do
    it 'can get to new post' do
      get :new, session: valid_session
      expect(response).to be_successful
    end
    it 'can get to post index' do
      get :index, session: valid_session
      expect(response).to be_successful
    end
  end
  describe "When there's no logged user" do
    it 'gets redirected' do
      sign_out :user
      get :new
      expect(response).to have_http_status(302)
    end
  end
end
