require "test_helper"

class DiscountRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount_rate = discount_rates(:one)
  end

  test "should get index" do
    get discount_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_rate_url
    assert_response :success
  end

  test "should create discount_rate" do
    assert_difference("DiscountRate.count") do
      post discount_rates_url, params: { discount_rate: { description: @discount_rate.description, discount: @discount_rate.discount, max: @discount_rate.max, min: @discount_rate.min, position: @discount_rate.position } }
    end

    assert_redirected_to discount_rate_url(DiscountRate.last)
  end

  test "should show discount_rate" do
    get discount_rate_url(@discount_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_discount_rate_url(@discount_rate)
    assert_response :success
  end

  test "should update discount_rate" do
    patch discount_rate_url(@discount_rate), params: { discount_rate: { description: @discount_rate.description, discount: @discount_rate.discount, max: @discount_rate.max, min: @discount_rate.min, position: @discount_rate.position } }
    assert_redirected_to discount_rate_url(@discount_rate)
  end

  test "should destroy discount_rate" do
    assert_difference("DiscountRate.count", -1) do
      delete discount_rate_url(@discount_rate)
    end

    assert_redirected_to discount_rates_url
  end
end
