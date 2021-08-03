class HooksController < ApplicationController
  # include ShopifyApp::WebhookVerification
  
  def delete_page
    shop = Shop.find_by(shopify_domain: params["domain"])
    initiate_shopify_session(shop)
    debugger
    # shop.destroy if shop.present?
    # render head :ok && return
  end

  def get_vendors
  	debugger
  end

   def get_content
   debugger
   initiate_shopify_session
   if @shop.vendors.any?
      @vendors = @shop.vendors
   end
   respond_to do |format|
        format.html # index.html.erb
        format.xml # index.xml.erb
    end
  end

  # def initiate_shopify_session(shop)
  #   # shopify_session = ShopifyAPI::Session.new(domain: shop.shopify_domain, token: shop.shopify_token, api_version: '2019-04')
  #   shopify_session = ShopifyAPI::Session.new(domain: 'ghtk-store.myshopify.com', token: shop.shopify_token, api_version: '2019-04')

  #   ShopifyAPI::Base.activate_session(shopify_session)
  # end

  # def clear_shopify_session
  #   ShopifyAPI::Base.clear_session
  # end
end