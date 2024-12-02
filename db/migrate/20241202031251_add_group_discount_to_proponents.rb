class AddGroupDiscountToProponents < ActiveRecord::Migration[7.2]
  def change
    add_column :proponents, :group_discount, :integer, :default => nil
  end
end
