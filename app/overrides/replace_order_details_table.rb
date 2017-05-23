Deface::Override.new(:virtual_path => "spree/shared/_order_details",
                     :name => "stocke_item_table_replace",
                     :replace => '[data-hook="order_details"]',
                     :partial => "spree/shared/order_detail_line_items",
                     :disabled => false)
