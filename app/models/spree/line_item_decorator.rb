Spree::LineItem.class_eval do
  has_one :sample_kit, :dependent => :destroy
  # Stolen from volume pricing's method of overriding line item prices, Praise the Sun!
  old_copy_price = instance_method(:copy_price)
  define_method(:copy_price) do
    old_copy_price.bind(self).call
    return unless variant

    if variant

        if self.is_kit?
          self.price = self.sample_kit.total_price and return
        end
        # is volume pricing installed?
        if defined? variant.volume_price()
          vprice = variant.volume_price(quantity, order.user)

          if price.present? && vprice <= variant.price
            self.price = vprice and return
          end
        end

      self.price = variant.price if price.nil?
    end

    self.price = variant.price if price.nil?

  end
  def is_kit?
    !self.sample_kit.nil?
  end
end
