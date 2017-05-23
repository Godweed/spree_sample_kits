Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "product_can_sample_admin_product_form",
                     :insert_after => "[data-hook='admin_product_form_description']",
                     :partial => "spree/admin/products/product_can_sample_fields",
                     :disabled => false)
