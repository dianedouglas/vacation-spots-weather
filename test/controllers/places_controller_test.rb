require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = places(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post :create, place: { 
        favorite_memory: 'going to the beach', 
        image_url: 'http://www.example.com/res.png', 
        location: 'philly', 
        visit_length: '1 week', 
      }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  test "should show place" do
    get :show, id: @place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    patch :update, id: @place, place: { favorite_memory: 'walking in the rain', image_url: @place.image_url, location: @place.location, visit_length: @place.visit_length }
    assert_redirected_to place_path(assigns(:place))
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to places_path
  end
end
