Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "replace_cart_form_variants",
                     :replace => "erb[silent]:contains('@product.variants_and_option_values(current_currency).each_with_index do |variant, index|')",
                     :text => "<% @product.variants_and_option_values(current_currency).reject{|variant| variant.is_sample == true}.each_with_index do |variant, index| %>",
                     :disabled => false)
