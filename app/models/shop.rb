# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorage

  def api_version
    ShopifyApp.configuration.api_version
  end

  has_one :setting
  has_many :vendors, dependent: :destroy
end
