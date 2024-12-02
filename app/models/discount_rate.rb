class DiscountRate < ApplicationRecord
  validates :min, presence: true
  validates :discount, presence: true

  scope :active, -> { where(:active => true)}

  def self.calculate_discount(last_position, position, initial_amount, total_amount)
    initial_amount = clean_value(initial_amount)
    discount_rate = DiscountRate.where(position: position).take
    last_discount_rate = DiscountRate.where(position: last_position).take
    new_position = position + 1

    return total_amount, last_discount_rate.try(:position) || nil if discount_rate.nil?

    discount_rate_min = clean_value(discount_rate.min)
    discount_rate_max = clean_value(discount_rate.max)
    last_discount_rate_max = clean_value(last_discount_rate.try(:max))
    discount_rate_discount = clean_value(discount_rate.discount, divisor: 100)


    if initial_amount >= discount_rate_min && initial_amount <= discount_rate_max
      discounted_amount, total_amount = calculate_amount(initial_amount, last_discount_rate_max, discount_rate_discount, total_amount).map(&:to_f)

      return total_amount, discount_rate.position
    end

    discounted_amount, total_amount = calculate_amount(discount_rate_max, last_discount_rate_max, discount_rate_discount, total_amount).map(&:to_f)

    calculate_discount(position, new_position, initial_amount, total_amount)
  end

  def self.calculate_amount(initial_amount, last_discount_rate_max, discount_rate, total_amount)
    discounted_amount = (initial_amount - last_discount_rate_max) * discount_rate

    total_amount += discounted_amount.truncate(2)

    return discounted_amount, total_amount
  end

  def self.clean_value(value, divisor: 1)
    return 0.0 if value.blank?

    cleaned_value = value.to_s.gsub(/[^\d,.-]/, '')

    if cleaned_value.include?(',') && cleaned_value.match?(/\d,\d{1,2}$/)
      cleaned_value = cleaned_value.gsub('.', '')
      cleaned_value = cleaned_value.gsub(',', '.')
    end

    cleaned_value.to_f / divisor
  end
end