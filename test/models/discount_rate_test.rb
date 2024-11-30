require 'test_helper'

class DiscountRateTest < ActiveSupport::TestCase
  def setup
    DiscountRate.all.delete_all
    @discount_rate_1 = DiscountRate.create(position: 1, min: 0.00, max: 1045.00, discount: 0.075)
    @discount_rate_2 = DiscountRate.create(position: 2, min: 1045.01, max: 2089.60, discount: 0.09)
    @discount_rate_3 = DiscountRate.create(position: 3, min: 2089.61, max: 3134.40, discount: 0.12)
    @discount_rate_3 = DiscountRate.create(position: 4, min: 3134.41, max: 6101.06, discount: 0.14)
    @active_discount_rate = DiscountRate.create(position: 1, min: 0.00, max: 1045.00, discount: 0.075, active: true)
    @inactive_discount_rate = DiscountRate.create(position: 2, min: 1045.01, max: 2089.60, discount: 0.09, active: false)
  end

  test "should return active discount rates" do
    active_discount_rates = DiscountRate.active

    assert_includes active_discount_rates, @active_discount_rate
    refute_includes active_discount_rates, @inactive_discount_rate
  end

  test 'should be valid with valid attributes' do
    assert @discount_rate_1.valid?
    assert @discount_rate_2.valid?
    assert @discount_rate_3.valid?
  end

  test 'should be invalid without min' do
    @discount_rate_1.min = nil
    assert_not @discount_rate_1.valid?
  end

  test 'should be invalid without discount' do
    @discount_rate_1.discount = nil
    assert_not @discount_rate_1.valid?
  end

  test '.calculate_discount should calculate the correct discount for given salary' do
    initial_amount = 3000.00
    total_amount = 0

    result = DiscountRate.calculate_discount(nil, 1, initial_amount, total_amount)

    expected_total = 281.62

    assert_in_delta result, expected_total, 0.01
  end

  test '.calculate_amount should calculate the discount for a given range' do
    initial_amount = 3000.00
    last_discount_rate_max = 2089.60
    discount_rate = 0.12
    total_amount = 0

    discounted_amount, new_total_amount = DiscountRate.calculate_amount(initial_amount, last_discount_rate_max, discount_rate, total_amount)

    expected_discount = (3000.00 - 2089.60) * 0.12
    expected_total = expected_discount + total_amount

    assert_in_delta discounted_amount, expected_discount.truncate(2), 0.01
    assert_in_delta new_total_amount, expected_total.truncate(2), 0.01
  end
end
