class AddProponentToContactsAndAddresses < ActiveRecord::Migration[7.2]
  def change
    add_reference :contacts, :proponent, foreign_key: true
    add_reference :addresses, :proponent, foreign_key: true
  end
end
