class VendorsController < AuthenticatedController
	before_action :get_shop
	before_action :find_shop
  def index
  	@vendors = @shop.vendors
    @collections = ShopifyAPI::CustomCollection.find(:all, :params => {:limit => 250})
  end

  def new_vendors
  	@vendors = @shop.vendors
  	@collections = ShopifyAPI::CustomCollection.find(:all, :params => {:limit => 250})
  end

  private

  	def find_shop
      @shop = Shop.find_by(shopify_domain: @current_shop.domain)
   end
end
