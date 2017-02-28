require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    user_one = users(:one)
    post :create, name: user_one.name, password: 'secret'
    assert_redirected_to places_url
    assert_equal user_one.id, session[:user_id]
  end

  test "should fail login" do
    user_one = users(:one)
    post :create, name: user_one.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    get :destroy
    assert_redirected_to root_url
  end

end
