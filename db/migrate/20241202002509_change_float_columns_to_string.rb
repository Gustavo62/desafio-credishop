class ChangeFloatColumnsToString < ActiveRecord::Migration[7.2]
  def up
    change_column :discount_rates, :min, :string
    change_column :discount_rates, :max, :string
    change_column :discount_rates, :discount, :string
    change_column :proponents, :inss_discount, :string
    change_column :proponents, :salary, :string
  end

  def down
    change_column :discount_rates, :min, :float
    change_column :discount_rates, :max, :float
    change_column :discount_rates, :discount, :float
    change_column :proponents, :inss_discount, :float
    change_column :proponents, :salary, :decimal
  end
end
