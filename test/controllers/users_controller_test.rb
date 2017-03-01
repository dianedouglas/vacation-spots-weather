require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test 'should get index' do
    # users page not public
    get :index
    assert_redirected_to root_url
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      # needs to be a unique name
      post :create, user: { name: 'Gandalf the Grey', password: 'secret', password_confirmation: 'secret' }
    end

    assert_redirected_to places_path
  end

  test 'should show user' do
    get :show, id: @user
    assert_response :success
    session[:user_id] = nil
    get :show, id: @user
    assert_redirected_to login_path
  end

  test 'should get edit' do
    get :edit, id: @user
    assert_response :success
    session[:user_id] = nil
    get :show, id: @user
    assert_redirected_to login_path
  end

  test 'should update user' do
    patch :update, id: @user, user: { name: @user.name, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to user_path(assigns(:user))
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
