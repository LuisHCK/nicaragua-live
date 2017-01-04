require 'test_helper'

class CouponRedemptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_redemption = coupon_redemptions(:one)
  end

  test "should get index" do
    get coupon_redemptions_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_redemption_url
    assert_response :success
  end

  test "should create coupon_redemption" do
    assert_difference('CouponRedemption.count') do
      post coupon_redemptions_url, params: { coupon_redemption: { profile_id: @coupon_redemption.profile_id, user_id: @coupon_redemption.user_id } }
    end

    assert_redirected_to coupon_redemption_url(CouponRedemption.last)
  end

  test "should show coupon_redemption" do
    get coupon_redemption_url(@coupon_redemption)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_redemption_url(@coupon_redemption)
    assert_response :success
  end

  test "should update coupon_redemption" do
    patch coupon_redemption_url(@coupon_redemption), params: { coupon_redemption: { profile_id: @coupon_redemption.profile_id, user_id: @coupon_redemption.user_id } }
    assert_redirected_to coupon_redemption_url(@coupon_redemption)
  end

  test "should destroy coupon_redemption" do
    assert_difference('CouponRedemption.count', -1) do
      delete coupon_redemption_url(@coupon_redemption)
    end

    assert_redirected_to coupon_redemptions_url
  end
end
