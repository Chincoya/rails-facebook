require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in build(:user)
  end

  test 'cant get anywhere without authentication' do
    sign_out :user
    get users_url
    assert_response :redirect
  end

  test 'get to signup page' do
    sign_out :user
    get new_user_session_path
    assert_response :success
  end

  test 'signup user can go to users_path' do
    get users_path
    assert_response :success
  end

end
