require "application_system_test_case"

class BranchOfficesTest < ApplicationSystemTestCase
  setup do
    @branch_office = branch_offices(:one)
  end

  test "visiting the index" do
    visit branch_offices_url
    assert_selector "h1", text: "Branch Offices"
  end

  test "creating a Branch office" do
    visit branch_offices_url
    click_on "New Branch Office"

    fill_in "Address", with: @branch_office.address
    fill_in "Email", with: @branch_office.email
    fill_in "Latitude", with: @branch_office.latitude
    fill_in "Longitude", with: @branch_office.longitude
    fill_in "Partner", with: @branch_office.partner_id
    fill_in "Phone", with: @branch_office.phone
    click_on "Create Branch office"

    assert_text "Branch office was successfully created"
    click_on "Back"
  end

  test "updating a Branch office" do
    visit branch_offices_url
    click_on "Edit", match: :first

    fill_in "Address", with: @branch_office.address
    fill_in "Email", with: @branch_office.email
    fill_in "Latitude", with: @branch_office.latitude
    fill_in "Longitude", with: @branch_office.longitude
    fill_in "Partner", with: @branch_office.partner_id
    fill_in "Phone", with: @branch_office.phone
    click_on "Update Branch office"

    assert_text "Branch office was successfully updated"
    click_on "Back"
  end

  test "destroying a Branch office" do
    visit branch_offices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Branch office was successfully destroyed"
  end
end
