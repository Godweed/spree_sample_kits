Deface::Override.new(:virtual_path => "spree/checkout/_delivery",
                     :name => "delivery_item_table_price_replace",
                     :replace => '.item-price',
                     :partial => "spree/checkout/stock_item_table",
                     :disabled => false)
