class DiscountRate < ApplicationRecord
  validates :min, presence: true
  validates :discount, presence: true

  scope :active, -> { where(:active => true)}

  def self.calculate_discount(last_position, position, initial_amount, total_amount)
    discount_rate = DiscountRate.where(position: position).take
    last_discount_rate = DiscountRate.where(position: last_position).take
    new_position = position + 1

    return total_amount if discount_rate.nil?

    if initial_amount >= discount_rate.min && initial_amount <= discount_rate.max
      discounted_amount, total_amount = calculate_amount(initial_amount, last_discount_rate.try(:max).to_f, discount_rate.discount, total_amount).map(&:to_f)

      return total_amount
    end

    discounted_amount, total_amount = calculate_amount(discount_rate.max, last_discount_rate.try(:max).to_f, discount_rate.discount, total_amount).map(&:to_f)

    calculate_discount(position, new_position, initial_amount, total_amount)
  end

  def self.calculate_amount(initial_amount, last_discount_rate_max, discount_rate, total_amount)
    discounted_amount = (initial_amount - last_discount_rate_max) * discount_rate
    total_amount += discounted_amount.truncate(2)

    return discounted_amount, total_amount
  end
end