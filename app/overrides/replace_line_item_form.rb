Deface::Override.new(:virtual_path => "spree/orders/_line_item",
                     :name => "replace_line_item_form",
                     :surround => '.line-item',
                     :text => "<% unless line_item.sample_kit.nil? %><%= render :partial => 'spree/orders/sample_kit_line_item_form', :locals => {:order_form => order_form, :line_item => line_item} %><% else %><%= render_original %><% end %>")
