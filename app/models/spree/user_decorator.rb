Spree.user_class.class_eval do
  has_many :sample_kits, class_name: Spree::SampleKit
end
