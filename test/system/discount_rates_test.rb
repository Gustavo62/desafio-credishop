require "application_system_test_case"

class DiscountRatesTest < ApplicationSystemTestCase
  setup do
    @discount_rate = discount_rates(:one)
  end

  test "visiting the index" do
    visit discount_rates_url
    assert_selector "h1", text: "Discount rates"
  end

  test "should create discount rate" do
    visit discount_rates_url
    click_on "New discount rate"

    fill_in "Description", with: @discount_rate.description
    fill_in "Discount", with: @discount_rate.discount
    fill_in "Max", with: @discount_rate.max
    fill_in "Min", with: @discount_rate.min
    fill_in "Position", with: @discount_rate.position
    click_on "Create Discount rate"

    assert_text "Discount rate was successfully created"
    click_on "Back"
  end

  test "should update Discount rate" do
    visit discount_rate_url(@discount_rate)
    click_on "Edit this discount rate", match: :first

    fill_in "Description", with: @discount_rate.description
    fill_in "Discount", with: @discount_rate.discount
    fill_in "Max", with: @discount_rate.max
    fill_in "Min", with: @discount_rate.min
    fill_in "Position", with: @discount_rate.position
    click_on "Update Discount rate"

    assert_text "Discount rate was successfully updated"
    click_on "Back"
  end

  test "should destroy Discount rate" do
    visit discount_rate_url(@discount_rate)
    click_on "Destroy this discount rate", match: :first

    assert_text "Discount rate was successfully destroyed"
  end
end
