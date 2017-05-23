class AddCanSampleToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :can_sample, :boolean, :default => false
  end
end
