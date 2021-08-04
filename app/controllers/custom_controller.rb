class CustomController < ApplicationController
  
   def index
	   @shop = Shop.find_by(shopify_token: params['storeToken'])
	   
	   # shopify_session = ShopifyAPI::Session.new(domain: @shop.shopify_domain, token: get_shop.shopify_token, api_version: '2019-04')
    # ShopifyAPI::Base.activate_session(shopify_session)
	   if @shop.vendors.any?
	      @vendors = @shop.vendors.where(visibility: true)
	   end
   respond_to do |format|
        format.html # index.html.erb
        format.xml # index.xml.erb
    end
  end
end
