class Spree::SampleKit < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class.to_s
  belongs_to :line_item
  has_many :sample_products, dependent: :destroy
  accepts_nested_attributes_for :sample_products
  scope :by_guest_token, -> (token) { where(guest_token: token) }

  def total_price
    sample_products.to_a.sum { |product| product.variant.price * product.quantity }
  end
  def display_total_price
    Spree::Money.new(sample_products.to_a.sum { |product| product.variant.price * product.quantity })
  end
  def total_quantity
    sample_products.sum(:quantity)
  end
end
