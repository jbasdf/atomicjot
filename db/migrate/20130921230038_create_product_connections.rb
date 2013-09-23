class CreateProductConnections < ActiveRecord::Migration
  def change
    create_table :product_connections do |t|
      t.integer :product_id
      t.integer :product_group_id
      t.timestamps
    end
    add_index :product_connections, [:product_id, :product_group_id]
  end
end
