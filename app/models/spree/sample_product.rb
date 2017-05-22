class Spree::SampleProduct < ActiveRecord::Base
  belongs_to :variant
  belongs_to :sample_kit
  belongs_to :line_item, dependent: :destroy

  def total
    quantity * variant.price
  end

  def sample_price
    variant.price * variant.sample_markup
  end

  def display_sample_price
    Spree::Money.new(sample_price)
  end

  def display_total
    Spree::Money.new(total)
  end
end
