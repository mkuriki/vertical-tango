class AddUniqueConstraintToClients < ActiveRecord::Migration[5.0]
  def change
    add_index :clients, :email, unique: true
  end
end
