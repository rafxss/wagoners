require 'test_helper'

class BranchOfficesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch_office = branch_offices(:one)
  end

  test "should get index" do
    get branch_offices_url
    assert_response :success
  end

  test "should get new" do
    get new_branch_office_url
    assert_response :success
  end

  test "should create branch_office" do
    assert_difference('BranchOffice.count') do
      post branch_offices_url, params: { branch_office: { address: @branch_office.address, email: @branch_office.email, latitude: @branch_office.latitude, longitude: @branch_office.longitude, partner_id: @branch_office.partner_id, phone: @branch_office.phone } }
    end

    assert_redirected_to branch_office_url(BranchOffice.last)
  end

  test "should show branch_office" do
    get branch_office_url(@branch_office)
    assert_response :success
  end

  test "should get edit" do
    get edit_branch_office_url(@branch_office)
    assert_response :success
  end

  test "should update branch_office" do
    patch branch_office_url(@branch_office), params: { branch_office: { address: @branch_office.address, email: @branch_office.email, latitude: @branch_office.latitude, longitude: @branch_office.longitude, partner_id: @branch_office.partner_id, phone: @branch_office.phone } }
    assert_redirected_to branch_office_url(@branch_office)
  end

  test "should destroy branch_office" do
    assert_difference('BranchOffice.count', -1) do
      delete branch_office_url(@branch_office)
    end

    assert_redirected_to branch_offices_url
  end
end
