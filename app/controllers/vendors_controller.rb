class VendorsController < AuthenticatedController
	before_action :get_shop
	before_action :find_shop, only: [:index, :new_vendors]
	before_action :get_vendor, only: [:update_vendor, :feature_brand]
	skip_before_action :verify_authenticity_token
  
  def index
  	@vendors = @shop.vendors
    @collections = ShopifyAPI::CustomCollection.find(:all, :params => {:limit => 250})
  end

  def update_vendor
  	if @vendor.visibility?
  		@vendor.update(visibility: false)
  		@success = false
  	else
  		@vendor.update(visibility: true)
  		@success = true
  	end
  end

  def feature_brand
  	if @vendor.is_featured?
  		@vendor.update(is_featured: false)
  		@success = false
  	else
  		@vendor.update(is_featured: true)
  		@success = true
  	end
  end

  def new_vendors
  	@vendors = @shop.vendors
  	@collections = ShopifyAPI::CustomCollection.find(:all, :params => {:limit => 250})
  end

   def upload_logo_image
   	@vendor = Vendor.find(params[:vendor][:id])
   	@vendor.update(logo: params[:vendor][:logo])
 respond_to do |format|
   format.html { redirect_to root_path }
   format.js
 end
  end

  private

  	def find_shop
      @shop = Shop.find_by(shopify_domain: @current_shop.domain)
   end

   def get_vendor
   	@vendor = Vendor.find(params[:id])	
   end
end
