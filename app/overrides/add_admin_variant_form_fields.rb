Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
                     :name => "variant_can_sample_admin_varaint_form_right",
                     :insert_after => "[data-hook='variants']",
                     :partial => "spree/admin/products/product_can_sample_fields",
                     :disabled => false)
