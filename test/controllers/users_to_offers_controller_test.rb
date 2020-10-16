require 'test_helper'

class UsersToOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_to_offer = users_to_offers(:one)
  end

  test "should get index" do
    get users_to_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_users_to_offer_url
    assert_response :success
  end

  test "should create users_to_offer" do
    assert_difference('UsersToOffer.count') do
      post users_to_offers_url, params: { users_to_offer: { offer_id: @users_to_offer.offer_id, user_id: @users_to_offer.user_id } }
    end

    assert_redirected_to users_to_offer_url(UsersToOffer.last)
  end

  test "should show users_to_offer" do
    get users_to_offer_url(@users_to_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_to_offer_url(@users_to_offer)
    assert_response :success
  end

  test "should update users_to_offer" do
    patch users_to_offer_url(@users_to_offer), params: { users_to_offer: { offer_id: @users_to_offer.offer_id, user_id: @users_to_offer.user_id } }
    assert_redirected_to users_to_offer_url(@users_to_offer)
  end

  test "should destroy users_to_offer" do
    assert_difference('UsersToOffer.count', -1) do
      delete users_to_offer_url(@users_to_offer)
    end

    assert_redirected_to users_to_offers_url
  end
end
