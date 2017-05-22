Spree::Variant.class_eval do
  has_many :sample_products, dependent: :destroy
end
