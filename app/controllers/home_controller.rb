# frozen_string_literal: true

class HomeController < AuthenticatedController
   before_action :get_shop
    before_action :find_shop

  def index
   if @shop.vendors.any?
      @vendors = @shop.vendors
   else
      @products = ShopifyAPI::Product.find(:all)
      @products.map(&:vendor).uniq.each do |vendor|
         @shop.vendors.create(name: vendor)
      end
   end
    @vendors = @shop.vendors
    @collections = ShopifyAPI::CustomCollection.find(:all)
    brands_page = 
                  "<main class='main-content' id='MainContent' role='main'>
                    <div class='page-width'>
                    <div class='grid'>
                      <div class='grid__item medium-up--five-sixths medium-up--push-one-twelfth'>
                        <div class='section-header text-center'>
                        </div>
                        <div class='rte'>
                          <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script><script src='https://brandpage-staging.aperitive.io/UI/JS/productview.js'></script>
                          <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
                          <div class='overlay'></div>
                          <div class='brandPage_Root'></div>
                          <script>
                            function httpGetAsync(theUrl, callback) {
                              var xmlHttp = new XMLHttpRequest();
                              xmlHttp.onreadystatechange = function() {
                                if (xmlHttp.readyState == 4 && xmlHttp.status == 200)   {
                                  var data = xmlHttp.responseText;
                                  data = data.replace(/'/g, '');
                                  console.log(data);
                                  var divElement = document.querySelector('.brandPage_Root');
                                  divElement.innerHTML =   data;
                                }
                              };
                              xmlHttp.open('GET', theUrl, true);
                              xmlHttp.send(null); 
                            }
                            httpGetAsync('https://252f9f0bd034.ngrok.io/custom/index?storeToken=#{@shop.shopify_token}');
                          </script>
                        </div>
                       </div>
                    </div>
                 </div>
                </main>"
  
    brands = ShopifyAPI::Page.where(title: "Brands") 
  return if @shop.page_title.present?
  if brands.any?
    ShopifyAPI::Page.create(title: "Brands-1", body_html: brands_page)
    @shop.update(page_title: "Brands-1")
  else
    ShopifyAPI::Page.create(title: "Brands", body_html: brands_page)
    @shop.update(page_title: "Brands")
  end
  #   if @shop.page_title == "Brands"
  #     return
  #   elsif brands.any?
  #     @create_new_page = ShopifyAPI::Page.create(title: "Brands-1", body_html: brands_page)
  #     @shop.update(page_title: "Brands-1")
  #   end
  # else
  #   @create_new_page = ShopifyAPI::Page.create(title: "Brands", body_html: brands_page)
  #   @shop.update(page_title: "Brands")
  # end
  end

  def help
  end

  def pricing
  end

  private

   def find_shop
      @shop = Shop.find_by(shopify_domain: @current_shop.domain)
   end
end