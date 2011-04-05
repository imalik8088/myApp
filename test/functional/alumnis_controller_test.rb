require 'test_helper'

class AlumnisControllerTest < ActionController::TestCase
  setup do
    @alumni = alumnis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alumnis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alumni" do
    assert_difference('Alumni.count') do
      post :create, :alumni => @alumni.attributes
    end

    assert_redirected_to alumni_path(assigns(:alumni))
  end

  test "should show alumni" do
    get :show, :id => @alumni.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @alumni.to_param
    assert_response :success
  end

  test "should update alumni" do
    put :update, :id => @alumni.to_param, :alumni => @alumni.attributes
    assert_redirected_to alumni_path(assigns(:alumni))
  end

  test "should destroy alumni" do
    assert_difference('Alumni.count', -1) do
      delete :destroy, :id => @alumni.to_param
    end

    assert_redirected_to alumnis_path
  end
end
