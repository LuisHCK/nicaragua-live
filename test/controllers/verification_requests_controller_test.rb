require 'test_helper'

class VerificationRequestsControllerTest < ActionController::TestCase
  setup do
    @verification_request = verification_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verification_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verification_request" do
    assert_difference('VerificationRequest.count') do
      post :create, verification_request: { user_id: @verification_request.user_id }
    end

    assert_redirected_to verification_request_path(assigns(:verification_request))
  end

  test "should show verification_request" do
    get :show, id: @verification_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @verification_request
    assert_response :success
  end

  test "should update verification_request" do
    patch :update, id: @verification_request, verification_request: { user_id: @verification_request.user_id }
    assert_redirected_to verification_request_path(assigns(:verification_request))
  end

  test "should destroy verification_request" do
    assert_difference('VerificationRequest.count', -1) do
      delete :destroy, id: @verification_request
    end

    assert_redirected_to verification_requests_path
  end
end
