Deface::Override.new(:virtual_path => "spree/admin/orders/_line_items",
                     :name => "add_admin_order_line_item_sample_kit",
                     :replace => "[data-hook='line-items']",
                     :partial => "spree/admin/orders/sample_kit_line_items",
                     :disabled => false)
