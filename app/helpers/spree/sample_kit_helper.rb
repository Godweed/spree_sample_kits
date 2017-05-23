module Spree::SampleKitHelper
  def can_sample?(product)
    return true if product.can_sample?
    product.variants.each do |variant|
      if variant.can_sample?
        return true
      end
    end
    return false
  end
end
