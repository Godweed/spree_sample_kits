Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_sample_products_form",
                     :insert_after => '[data-hook="cart_form"]',
                     :partial => "spree/products/sample_products_form",
                     :disabled => false)
