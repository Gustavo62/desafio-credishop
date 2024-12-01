class CreateProponents < ActiveRecord::Migration[7.2]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.date :birthday
      t.decimal :salary
      t.references :address, foreign_key: true
      t.references :contact, foreign_key: true
      t.float :inss_discount

      t.timestamps
    end
  end
end
