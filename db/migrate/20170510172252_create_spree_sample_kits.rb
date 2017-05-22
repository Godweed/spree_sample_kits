class CreateSpreeSampleKits < ActiveRecord::Migration
  def self.up
    create_table :spree_sample_kits do |t|
      t.belongs_to :user
      t.string :guest_token
      t.references :line_item
      t.timestamps
    end
    add_index :spree_sample_kits, :user_id
    add_index :spree_sample_kits, :guest_token
    add_index :spree_sample_kits, :line_item_id

    create_table :spree_sample_products do |t|
      t.references :variant
      t.references :sample_kit
      t.integer :quantity, :default => 1
      t.timestamps null: false
    end
    add_index :spree_sample_products, :variant_id
    add_index :spree_sample_products, :sample_kit_id

  end

  def self.down
    drop_table :spree_sample_kits
    drop_table :spree_sample_products
  end
end
