require 'test_helper'

class ClientsProfilesControllerTest < ActionController::TestCase
  setup do
    @clientprofile = clientprofiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientprofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientprofile" do
    assert_difference('ClientsProfile.count') do
      post :create, clientprofile: { name: @clientprofile.name }
    end

    assert_redirected_to clientprofile_path(assigns(:clientprofile))
  end

  test "should show clientprofile" do
    get :show, id: @clientprofile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientprofile
    assert_response :success
  end

  test "should update clientprofile" do
    patch :update, id: @clientprofile, clientprofile: { name: @clientprofile.name }
    assert_redirected_to clientprofile_path(assigns(:clientprofile))
  end

  test "should destroy clientprofile" do
    assert_difference('ClientsProfile.count', -1) do
      delete :destroy, id: @clientprofile
    end

    assert_redirected_to clientprofiles_path
  end
end
