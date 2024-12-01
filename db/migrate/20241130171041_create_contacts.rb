class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :contact_type

      t.timestamps
    end
  end
end
