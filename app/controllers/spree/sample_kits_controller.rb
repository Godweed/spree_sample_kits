class Spree::SampleKitsController < Spree::StoreController
  include Spree::Core::ControllerHelpers::Order
  before_filter :set_sample_kit, only: [:destroy, :show, :index, :add, :clear, :build]
  before_filter :set_order, only: [:add]


  def build
  end

  def new
    if try_spree_current_user
      @sample_kit = spree_current_user.sample_kit.new
    elsif cookies.signed[:guest_token].present?
      @sample_kit = Spree::SampleKit.new guest_token: cookies.signed[:guest_token]
    else
      guest_token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Spree::SampleKit.exists?(guest_token: random_token)
      end
      cookies.permanent.signed[:guest_token] = guest_token
      @sample_kit = Spree::SampleKit.new guest_token: cookies.signed[:guest_token]
    end
  end

  def create
    if try_spree_current_user
      @sample_kit = spree_current_user.sample_kit.new
    elsif cookies.signed[:guest_token].present?
      @sample_kit = Spree::SampleKit.new guest_token: cookies.signed[:guest_token]
    else
      guest_token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Spree::SampleKit.exists?(guest_token: random_token)
      end
      cookies.permanent.signed[:guest_token] = guest_token
      @sample_kit = Spree::SampleKit.new guest_token: cookies.signed[:guest_token]
    end
    if @success = @sample_kit.save
      redirect_to sample_kit_build_path
    else
      render "new"
    end
  end

  def add
    if @order && @sample_kit
      Spree::PermittedAttributes.line_item_attributes << :sample_kit_id
      if @sample_kit.total_quantity >= 5

        @variant = Spree::Variant.where(:sku => 'SMP0001').take

        if @variant && @variant.can_supply?
          @line_item = @order.contents.add(@variant, 1)

          @line_item.sample_kit = @sample_kit
          @line_item.save!
          @sample_kit.line_item = @line_item

          @order.contents.update_cart({})
        else
          flash[:notice] = "Variant not found with SKU SMP0001, please ensure you have properly configured it in the admin dashboard."
        end
        redirect_to cart_path

      else
        redirect_to sample_kit_build_path
      end
    else
      redirect_to sample_kit_build_path
    end
  end

  def clear
    if @sample_kit
      @sample_kit.destroy
      set_sample_kit
    end
    redirect_to sample_kit_build_path
  end

  private

  def set_sample_kit
    if try_spree_current_user
      @sample_kit = Spree::SampleKit.where(:user_id => spree_current_user.id, :line_item_id => nil).first_or_create
    elsif cookies.signed[:guest_token].present?
      @sample_kit = Spree::SampleKit.by_guest_token(cookies.signed[:guest_token]).where(:line_item_id => nil).first_or_create
    else
      @sample_kit = []
    end
  end
  def set_order
    @order = current_order(:create_order_if_necessary => true)
  end
end
