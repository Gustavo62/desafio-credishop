class CreateDiscountRates < ActiveRecord::Migration[7.2]
  def change
    create_table :discount_rates do |t|
      t.float :min
      t.float :max
      t.string :description
      t.float :discount
      t.integer :position

      t.timestamps
    end
  end
end
