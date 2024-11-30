class AddYearAndActiveToDiscountRates < ActiveRecord::Migration[7.2]
  def change
    add_column :discount_rates, :year, :integer
    add_column :discount_rates, :active, :boolean, default: true, null: false
  end
end
