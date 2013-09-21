class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.integer :user_id
      t.string :external_id
      t.string :name
      t.string :url, :limit => 2048
      t.string :jot  #used for subdomains ie bikes.atomicjot.com
      t.string :theme
      t.string :logo
      t.string :css
      t.timestamps
    end
    add_index "websites", ["jot"]
    add_index "websites", ["url"]
  end
end
