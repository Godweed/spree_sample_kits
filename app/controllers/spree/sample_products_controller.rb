class Spree::SampleProductsController < Spree::BaseController
  before_filter :set_sample_kit
  def create

      if @sample_kit.total_quantity < 10
        @sample_product = get_sample_by_variant(sample_product_attributes[:variant_id])
        if @sample_product
          @sample_product.quantity += 1
          @sample_product.save
        else
          @sample_product = Spree::SampleProduct.new(sample_product_attributes)
          @sample_product.sample_kit = @sample_kit
          @sample_product.save
        end

      else
        flash[:notice] = "Sorry, but sample kits may only contain 10 total samples at a time! Please remove some before trying again."
      end

    respond_with(@sample_product) do |format|
      format.html { redirect_to @sample_kit }
    end
  end

  def update

    @sample_product = @sample_kit.sample_products.find(params[:id])


    if @sample_product
      current_quantity = @sample_product.quantity
      new_quantity =  params[:sample_product][:quantity].to_i - current_quantity
      if params[:sample_product][:quantity].to_i <= 0
        @sample_product.destroy
      else
        if (@sample_kit.total_quantity + new_quantity) <= 10
          @sample_product.quantity += new_quantity
          @sample_product.save
        else
          flash[:notice] = "Sorry, but sample kits may only contain 10 total samples at a time! Please remove some before trying again."
        end
      end
    end

    respond_with(@sample_product) do |format|
      format.html { redirect_to @sample_kit }
    end
  end

  def destroy
    @sample_product = @sample_kit.sample_products.find(params[:id])
    @sample_product.destroy

    respond_with(@sample_product) do |format|
      format.html { redirect_to @sample_kit }
    end
  end

  private
  def get_sample_by_variant(variant_id)
    variant = @sample_kit.sample_products.where(:variant_id => variant_id).take
    return variant
  end

  def sample_product_attributes
    params.require(:sample_product).permit(:variant_id, :quantity)
  end

  def set_sample_kit
    if try_spree_current_user
      @sample_kit = Spree::SampleKit.where(:user_id => spree_current_user.id, :line_item_id => nil).first_or_create
    elsif cookies.signed[:guest_token].present?
      @sample_kit = Spree::SampleKit.by_guest_token(cookies.signed[:guest_token]).where(:line_item_id => nil).first_or_create
    else
      @sample_kit = []
    end
  end
end
