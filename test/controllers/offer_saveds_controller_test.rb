require 'test_helper'

class OfferSavedsControllerTest < ActionController::TestCase
  setup do
    @offer_saved = offer_saveds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offer_saveds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer_saved" do
    assert_difference('OfferSaved.count') do
      post :create, offer_saved: { offer_id: @offer_saved.offer_id, user_id: @offer_saved.user_id }
    end

    assert_redirected_to offer_saved_path(assigns(:offer_saved))
  end

  test "should show offer_saved" do
    get :show, id: @offer_saved
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer_saved
    assert_response :success
  end

  test "should update offer_saved" do
    patch :update, id: @offer_saved, offer_saved: { offer_id: @offer_saved.offer_id, user_id: @offer_saved.user_id }
    assert_redirected_to offer_saved_path(assigns(:offer_saved))
  end

  test "should destroy offer_saved" do
    assert_difference('OfferSaved.count', -1) do
      delete :destroy, id: @offer_saved
    end

    assert_redirected_to offer_saveds_path
  end
end
