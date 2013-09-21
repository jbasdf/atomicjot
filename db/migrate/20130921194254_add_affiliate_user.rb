class AddAffiliateUser < ActiveRecord::Migration
  def change

    add_column :users, :affiliate_id, :integer
    add_column :users, :auth_key, :string

    add_column :users, :amazon_associate_id, :string
    add_column :users, :commission_junction_id, :string
    add_column :users, :affiliatefuture_id, :string
    add_column :users, :affiliate_window_id, :string

    add_index :users, [:affiliate_id, :auth_key]

    create_table :associations do |t|
      t.integer :user_id
      t.integer :merchant_id
      t.timestamps
    end
    add_index :associations, [:user_id]
    add_index :associations, [:merchant_id]

  end
end