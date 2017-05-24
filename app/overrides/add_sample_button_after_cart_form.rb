Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "add_sample_product_form",
                     :insert_after => '.add-to-cart',
                     :partial => "spree/products/sample_products_button",
                     :disabled => false)
