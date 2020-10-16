require "application_system_test_case"

class UsersToOffersTest < ApplicationSystemTestCase
  setup do
    @users_to_offer = users_to_offers(:one)
  end

  test "visiting the index" do
    visit users_to_offers_url
    assert_selector "h1", text: "Users To Offers"
  end

  test "creating a Users to offer" do
    visit users_to_offers_url
    click_on "New Users To Offer"

    fill_in "Offer", with: @users_to_offer.offer_id
    fill_in "User", with: @users_to_offer.user_id
    click_on "Create Users to offer"

    assert_text "Users to offer was successfully created"
    click_on "Back"
  end

  test "updating a Users to offer" do
    visit users_to_offers_url
    click_on "Edit", match: :first

    fill_in "Offer", with: @users_to_offer.offer_id
    fill_in "User", with: @users_to_offer.user_id
    click_on "Update Users to offer"

    assert_text "Users to offer was successfully updated"
    click_on "Back"
  end

  test "destroying a Users to offer" do
    visit users_to_offers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users to offer was successfully destroyed"
  end
end
