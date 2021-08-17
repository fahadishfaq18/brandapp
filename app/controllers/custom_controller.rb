class CustomController < ApplicationController
  
   def index
     @shop = Shop.find_by(shopify_token: params['storeToken'])
     if @shop.vendors.any?
        @vendors = @shop.vendors.where(visibility: true)
     end
     respond_to do |format|
          format.html
      end
  end
end
