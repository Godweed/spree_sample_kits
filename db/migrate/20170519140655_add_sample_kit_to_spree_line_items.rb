class AddSampleKitToSpreeLineItems < ActiveRecord::Migration
  def change
    add_reference :spree_line_items, :sample_kit, index: true
  end
end
