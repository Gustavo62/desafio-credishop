class AddOnDeleteCascadeToForeignKeys < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :contacts, :proponents
    add_foreign_key :contacts, :proponents, on_delete: :cascade

    remove_foreign_key :addresses, :proponents
    add_foreign_key :addresses, :proponents, on_delete: :cascade
  end
end
