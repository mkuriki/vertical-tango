class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :email, null: false
      t.string :phone, null: false
      t.timestamps
    end
  end
end
