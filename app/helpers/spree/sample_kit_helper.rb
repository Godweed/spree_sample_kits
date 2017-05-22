module Spree::SampleKitHelper
  def can_sample?(product)
    product.variants.each do |variant|
      if variant.is_sample?
        return true
      end
    end
    return false
  end
end
