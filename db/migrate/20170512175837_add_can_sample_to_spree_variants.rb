class AddCanSampleToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :can_sample, :boolean, :default => false
  end
end
