ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = '36156fe6b232ba6d02e954bfe3395904'
  config.secret = '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'
  config.old_secret = ""
  config.scope = "read_themes, write_themes,read_script_tags, write_script_tags, read_customers, write_customers, read_products, write_products, write_content, read_orders, write_orders, read_shipping, write_shipping, read_fulfillments, write_fulfillments"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2021-07"
  config.shop_session_repository = 'Shop'
  config.allow_jwt_authentication = true
  config.webhooks = [
    { topic: 'app/uninstalled', address: 'https://252f9f0bd034.ngrok.io/hooks/delete_page', format: 'json' },
    { topic: 'products/create', address: 'https://252f9f0bd034.ngrok.io/hooks/get_vendors', format: 'json' }
  ]
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
