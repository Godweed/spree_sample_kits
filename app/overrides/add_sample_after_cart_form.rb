Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_sample_product_form",
                     :insert_before => '[data-hook="cart_form"]',
                     :partial => "spree/products/sample_product_form",
                     :disabled => false)
