Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "add_sample_kit_form",
                     :insert_after => '[data-hook="cart_form"]',
                     :partial => "spree/products/sample_product_form",
                     :disabled => false)
