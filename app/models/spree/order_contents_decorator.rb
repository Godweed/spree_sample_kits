Spree::OrderContents.class_eval do

  def add_to_line_item(variant, quantity, options = {})

    line_item = grab_line_item_by_variant(variant, false, options)

      if line_item && line_item.sample_kit.nil?

          line_item.quantity += quantity.to_i
          line_item.currency = currency unless currency.nil?

      else
        opts = ActionController::Parameters.new(options.to_h).permit(Spree::PermittedAttributes.line_item_attributes).to_h.merge( { currency: order.currency } )
        line_item = order.line_items.new(quantity: quantity,
                                          variant: variant,
                                          options: opts)
      end

    line_item.target_shipment = options[:shipment] if options.has_key? :shipment
    line_item.save!
    line_item
  end

end
