class AddCanSampleToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :can_sample, :boolean, :default => true
  end
end
