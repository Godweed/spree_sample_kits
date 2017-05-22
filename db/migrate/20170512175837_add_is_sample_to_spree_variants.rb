class AddIsSampleToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :is_sample, :boolean, :default => false
  end
end
