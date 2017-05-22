Deface::Override.new(:virtual_path => "spree/checkout/_delivery",
                     :name => "stocke_item_table_replace",
                     :replace => '[data-hook="stock-contents"]',
                     :partial => "spree/checkout/stock_item_table",
                     :disabled => false)
