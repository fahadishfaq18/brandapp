# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated

  def get_shop
  	@current_shop = ShopifyAPI::Shop.current
  end

  def initiate_shopify_session
    shopify_session = ShopifyAPI::Session.new(domain: get_shop.shopify_domain, token: get_shop.shopify_token, api_version: '2019-04')
    ShopifyAPI::Base.activate_session(shopify_session)
  end

  def clear_shopify_session
    ShopifyAPI::Base.clear_session
  end
end
