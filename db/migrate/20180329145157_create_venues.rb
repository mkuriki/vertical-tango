class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.timestamps
    end
  end
end
