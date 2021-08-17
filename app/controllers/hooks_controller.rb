class HooksController < ApplicationController
  include ShopifyApp::WebhookVerification

  def delete_page
    shop = Shop.find_by(shopify_domain: params["domain"])
      shopify_session = ShopifyAPI::Session.new(domain: shop.shopify_domain, token: shop.shopify_token, api_version: '2019-04')
    ShopifyAPI::Base.activate_session(shopify_session)
    if shop.present?
    	# shop.update(page_title: nil)
    	brands = ShopifyAPI::Page.where(title: @shop.page_title)
    end
  end

  def get_vendors
  end
end