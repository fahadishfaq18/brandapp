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
    # @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @collections = ShopifyAPI::CustomCollection.find(:all, :params => {:limit => 250})
    # debugger
    brands_page = "<main class='main-content' id='MainContent' role='main'>
   <div class='page-width'>
      <div class='grid'>
         <div class='grid__item medium-up--five-sixths medium-up--push-one-twelfth'>
            <div class='section-header text-center'>
            </div>
            <div class='rte'>
               <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script><script src='https://brandpage-staging.aperitive.io/UI/JS/productview.js'></script>
               <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
               <div class='overlay'></div>
               <div class='brandPage_Root'>
                  
               </div>


               
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
                httpGetAsync('https://brands-app-1.herokuapp.com/custom/index?storeToken=#{@shop.shopify_token}');
                var access_token='a9127c4e1e16b9df5acd067dc2e93f4a';
                var getproducturl='https://brands-app-1.herokuapp.com/getProducts?';
                var getcurrencyurl='https://brands-app-1.herokuapp.com/getCurrency?';
                var storename='brandpageapp.myshopify.com';
                var storeurl='https://brandpageapp.myshopify.com/admin/products.json?';
                </script>
               <style> 
                  @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700');
                  @import url('https://fonts.googleapis.com/css?family=Open+Sans');
                  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');
                  .owl-theme .owl-controls .owl-buttons div {
                  opacity: .9;
                  }
                  .owl-carousel {
                  clear: both;
                  position: relative;
                  }
                  .owl-next {
                  width: 68px;
                  height: 68px;
                  background: url(http://brandpagev2.aperitive.io/uploads/next-arrow.png) no-repeat !important;
                  position: absolute;
                  right: 0;
                  top: 40%;
                  font-size: 0 !important;
                  }
                  .owl-prev {
                  width: 68px;
                  height: 68px;
                  background: url(http://brandpagev2.aperitive.io/uploads/prev-arrow.png) no-repeat !important;
                  position: absolute;
                  left: 0;
                  top: 40%;
                  font-size: 0 !important;
                  }
                  .m-container {
                  max-width: 1170px;
                  margin: auto;
                  }
                  .col-12 {
                  float: left;
                  width: 100%;
                  }
                  .col-3 {
                  float: left;
                  width: 33.33333333%;
                  }
                  .col-4 {
                  float: left;
                  width: 33%;
                  }
                  .Feature-headng {
                  /*font-family: 'Open Sans',sans-serif;*/
                  font-size: 20px !important;
                  font-weight: 600!important;
                  text-align: center;
                  }
                  h2.sort-heading {
                  font-size: 18px;
                  letter-spacing: .14285714rem;
                  color: #000;
                  text-transform: uppercase;
                  /*font-family: 'Open Sans',sans-serif;*/
                  }
                  .numeric-order .list-box ul li a, .numeric-order h6 {
                  /*font-family: 'Open Sans',sans-serif;*/
                  text-transform: capitalize;
                  }
                  h2.sort-heading span {
                  font-size: 12px;
                  margin-left: 10px;
                  font-weight: 600;
                  color: #000;
                  }
                  .organiz-sec ul li {
                  display: inline;
                  float: left;
                  margin-right: 15px;
                  }
                  .organiz-sec ul li a {
                  transition: background-color .25s ease-in-out,color .25s ease-in-out;
                  color: #717171;
                  text-decoration: none;
                  cursor: pointer;
                  /*font-family: 'Open Sans',sans-serif;*/
                  font-weight: 400;
                  font-size: 14px;
                  }
                  .organiz-sec ul {
                  margin: 0;
                  padding: 0;
                  list-style: none;
                  }
                  .numeric-order {
                  float: left;
                  width: 100%;
                  padding-bottom: 20px;
                  }
                  .numeric-order h6 {
                  font-weight: 700;
                  font-size: 18px;
                  color: #000;
                  margin: 20px 0;
                  }
                  .numeric-order .list-box ul {
                  list-style: none;
                  margin: 0;
                  padding: 0;
                  }
                  .numeric-order .list-box ul li {
                  padding-bottom: 7px;
                  }
                  .numeric-order .list-box ul li a {
                  color: #232121;
                  text-decoration: none;
                  cursor: pointer;
                  font-weight: 400;
                  font-size: 16px;
                  border:none;
                  }
                  .brands-box ul {
                  list-style: none;
                  margin: 0;
                  padding: 0;
                  }
                  .brands-box ul li {
                  float: left;
                  width: 24%;
                  text-align: center;
                  padding: 40px 0;
                  margin-bottom: 20px;
                  border: 1px solid #c9c6c6;
                  box-sizing: border-box;
                  margin-right: 1%;
                  }
                  .media-box img {
                  width: 100%;
                  max-width: 100%;
                  }
                  .media-box {
                  max-width: 180px;
                  height: 80px;
                  margin: auto;
                  width: 100%;
                  }
                  .btn-box .btn {
                  display: inline-table;
                  text-align: center;
                  padding: .6875rem 1.25rem;
                  background: #e45625;
                  color: #fff;
                  text-transform: uppercase;
                  font-weight: 700;
                  border: .125rem solid #e45625;
                  font-size: .8125rem;
                  transition: all .3s ease-out;
                  }
                  .product_count {
                  float: right;
                  text-align: center;
                  margin-top: 6px !important;
                  font-size: 16px;
                  margin-right: 16px;
                  color: #000;
                  }
                  .form-group.sort_order_div {
                  text-align: center;
                  float: right;
                  max-width: 376px;
                  width: 100%;
                  }
                  .test.form-inline label {
                  margin-right: 10px;
                  float: left;
                  margin-top: 12px;
                  }
                  select#sort_order {
                  float: left;
                  width: 100%;
                  max-width: 179px;
                  color:#000;
                  }
                  @media (max-width:640px) {
                  .form-group.sort_order_div {
                  max-width: 100%;
                  width: 100%;
                  }
                  }
                  @media (max-width:576px) {
                  .m-col-12 {
                  width: 100%;
                  }
                  .carousel-inner {
                  max-height: 400px;
                  overflow: scroll;
                  }
                  }
                  @media (min-width:991px) {
                  .numeric-order .list-box ul li {
                  float: left;
                  width: 100%;
                  }
                  @media (max-width:991px) and (min-width:567px) {
                  .numeric-order .list-box ul li {
                  float: left;
                  width: 50%;
                  }
                  .brands-box ul li {
                  width: 48% !important;
                  margin-right: 1%;
                  }
                  .sm-col-6 {
                  width: 100%;
                  }
                  }
                  }
                  @media (max-width:567px) and (min-width:320px) {
                  .numeric-order .list-box ul li {
                  float: left;
                  width: 100%;
                  }
                  .brands-box ul li {
                  width: 100% !important;
                  margin-right: 1%;
                  }
                  .sm-col-6 {
                  float: left;
                  width: 100%;
                  }
                  }
                  @media (max-width:400px) {
                  select#sort_order {
                  float: left;
                  width: 100%;
                  max-width: 152px;
                  }
                  .product_count {
                  float: left;
                  padding-left: 61px;
                  }
                  }
                  .num-conytent {
                  float: left;
                  width: 100%;
                  }
                  .eye {
                  height: 30px;
                  width: 30px;
                  border: 1px solid red;
                  cursor: pointer;
                  }
                  .thumbnail {
                  position: relative;
                  padding: 0;
                  margin-bottom: 20px;
                  }
                  .thumbnail img {
                  width: 100%;
                  }
                  .modal-dialog {
                  width: 100%;
                  max-width: 90%;
                  margin: 30px auto;
                  }
                  a.left.carousel-control, a.right.carousel-control {
                  width: 45px;
                  height: 45px;
                  line-height: 39px;
                  position: absolute;
                  top: 42%;
                  border-radius: 100%;
                  font-size: 36px;
                  background-image: none;
                  }
                  a.left.carousel-control {
                  background-color: rgba(0,0,0,.5);
                  left: 12px;
                  }
                  a.left.carousel-control:hover {
                  background-color: rgba(0,0,0,.75);
                  }
                  a.right.carousel-control {
                  background-color: rgba(0,0,0,.5);
                  right: 12px;
                  }
                  .custom-bottom .title, .custom-bottom div {
                  font-size: 16px;
                  text-transform: capitalize;
                  }
                  a.right.carousel-control:hover {
                  background-color: rgba(0,0,0,.75);
                  }
                  .item-custom {
                  /* background: #f5f5f5; */
                  /* border: 1px solid #e3e3e3; */
                  min-height: 316px;
                  }
                  .item-custom a img {
                  width: 100%;
                  /* object-fit: cover; */
                  height: auto;
                  }
                  .custom-bottom {
                  padding: 13px;
                  /*font-family: Poppins,sans-serif;*/
                  }
                  .custom-bottom div {
                  /*font-family: initial;*/
                  margin-bottom: 2px;
                  color: #509aa2;
                  }
                  .custom-bottom .title {
                  /*font-family: Poppins,sans-serif;*/
                  margin-bottom: 9px;
                  font-weight: 600;
                  color: #000;
                  }
                  .custom-bottom .title a:hover {
                  text-decoration: none;
                  }
                  #myModal .modal-title {
                  font-size: 26px;
                  text-transform: capitalize;
                  border-bottom: 1px solid #000;
                  }
                  .custom-bottom .title a {
                  color: #509aa2;
                  }
                  .custom-bottom span {
                  font-weight: 700;
                  color: #000;
                  }
                  #myModal .modal-header {
                  padding: 15px;
                  border-bottom: none;
                  }
                  .carousel-indicators .active {
                  background-color: #636363;
                  margin-right: 3px;
                  }
                  #myModal .carousel-inner {
                  padding-bottom: 50px;
                  }
                  #myModal .modal-header .close:focus {
                  outline: 0;
                  box-shadow: none;
                  }
                  .modal {
                  display: none;
                  position: fixed;
                  z-index: 1;
                  padding-top: 40px;
                  left: 0;
                  top: 0;
                  width: 100%;
                  height: 100%;
                  background-color: #000;
                  background-color: rgba(0,0,0,.4);
                  overflow-y: hidden;
                  z-index: 9999;
                  }
                  .modal-content {
                  background-color: #fefefe;
                  margin: auto;
                  padding: 20px;
                  border: 1px solid #888;
                  width: 80%;
                  min-height:500px !important;
                  }
                  .close {
                  color: black;
                  float: right;
                  font-size: 0px;
                  font-weight: 700;
                  margin-top: 9px;
                  opacity: inherit;
                  }
                  .close:focus, .close:hover {
                  color: #000;
                  text-decoration: none;
                  cursor: pointer;
                  }
                  .close:before {
                  content: 'X';
                  font-size: 20px;  
                  color: #333;
                  margin-top: 4px;
                  display: inline-block;
                  }
                  .carousel-indicators {
                  width: 100%;
                  margin-left: 0 !important;
                  left: 0;
                  }
                  .carousel-indicators .active {
                  background-color: none;
                  margin-right: 3px;
                  }
                  .carousel-indicators li {
                  background-color: #eee;
                  }
                  .form-group.sort_order_div {
                  text-align: center;
                  }
                  .modal-titleed {
                  text-align: center;
                  margin-top: 10px !important;
                  font-size: 24px;
                  float: left;
                  color: #000;
                  }
                  .test.form-inline label {
                  margin-right: 10px;
                  color: #000;
                  }
                  .carousel-caption.product_count {
                  text-shadow: none;
                  padding-bottom: 0px;
                  bottom: 50px;
                  }
                  .item-custom .custom-bottom .title a {
                  height: 50px;
                  /* overflow: hidden; */
                  display: inline-block;
                  width: 200px;
                  white-space: pre-wrap;
                  overflow: hidden !important;
                  text-overflow: ellipsis;
                  margin-bottom: 0px;
                  }
                  .item-custom a img {
                  object-fit: contain;
                  height: 100%;
                  }
                  .item-custom a {
                  height: 322px;
                  display: inline-block;
                  width: 100%;
                  overflow: hidden;
                  }
                  .custom-bottom .title a {
                  height: auto;
                  }
                  #myModal .carousel-indicators {
                  bottom: 0;
                  }
                  @media (min-width:991px) {
                  .dek-none {
                  display: none;
                  }
                  .form-group.sort_order_div form.test.form-inline {
                  float: right;
                  margin-right: 10px;
                  max-width: 249px;
                  width: 100%;
                  }
                  }
                  @media (max-width:991px) and (min-width:320px) {
                  .carousel-caption.product_count {
                  display:none;
                  }
                  }
                  @media (max-width:991px) {
                  .item-custom a {
                  height: 170px;
                  display: inline-block;
                  width: 100%;
                  }
                  #myCarousel .item-custom .custom-bottom .title a {
                  height: auto;
                  /* overflow: hidden; */
                  display: inline-block;
                  width: 100%;
                  overflow: hidden !important;
                  text-overflow: ellipsis;
                  margin-bottom: 0px;
                  word-break: break-word;
                  }
                  }
                  @media (max-width:767px) {
                  .item-custom a {
                  height: auto;
                  display: inline-block;
                  width: 100%;
                  }
                  .carousel-inner {
                  max-height: 400px;
                  overflow: scroll;
                  }
                  }
                  .custom-bottom.title, .custom-bottom div {font-size:16px;font-weight:600} .brandPage_item{ font-size: px !important; color: #000000 !important;} .brandPage_header{ border-bottom: 1px solid #a2a2a2;} .brandPage_Root ul.nonFeaturedBrands{    -webkit-columns: 100px 4;    -moz-columns: 100px 4;     columns: 100px 4;}  .brandPage_Root ul.featuredBrands li ul{    -webkit-columns: 100px 3;    -moz-columns: 100px 3;     columns: 100px 3;}  @media only screen and (max - width: 769px) {.brandPage_Root ul.nonFeaturedBrands{ -webkit - columns: 100px 2 !important; -moz - columns: 100px 2 !important; columns: 100px 2 !important; } } @media only screen and (max - width: 769px) {.brandPage_Root ul.featuredBrands li ul{ -webkit - columns: 100px 2 !important; -moz - columns: 100px 2 !important; columns: 100px 2 !important; } } .brandPage_header{ padding-bottom: 5px;margin-top: 40px; font-size: 117px !important; color: #000000 !important;}.brandPage_Root li, .brandPage_Root ul {line-height:1.3;    margin-bottom: 10px;list-style:none !important;} .brandPage_Root > ul{margin-left: 0; padding-left: 5px;} @media only screen and (max-width: 769px) {.brandPage_Root > ul > li >ul{margin-left:0  }} img.brand_Image { max-width:  100px ; object-fit: contain;}@media (max-width: 1920px) and (min-width: 800px){ .brand_Image{ width: 100px !important;height: 50px !important;}}  .brandPage_item figure{ min-height: 40px; margin:0; display: inline-block;} @media (max-width: 4000px) and (min-width: 1921px){ .brand_Image{ width: 100px !important;height: 50px !important;}}  .brandPage_item figure{ min-height: 40px; margin:0; display: inline-block;}  .brand_OnSale { width: 30px; height: 30px; margin: 5px; vertical - align: top; }.rte a:not(.image-link)::after, .rte-setting a:not(.image-link)::after, .text-link:not(.image-link)::after { content: ''; width: 100%;position: absolute;left: 0;bottom: 2px; border-bottom: none;}.custom-bottom .title a { color: #000000; }.custom-bottom div {color: #000000 ;}.custom-bottom span {font-size: px;color: #000000 ;} 
               </style>
            </div>
         </div>
      </div>
   </div>
</main>"




#     brands_page = "<div class='page-width'>
#   <div class='grid'>
#     <div class='grid__item medium-up--five-sixths medium-up--push-one-twelfth'>
#       <div class='section-header text-center'>
#       </div>
#       <div class='rte'>
#         <h1>Ali is heredsfasfad </h1>
#         <h2>Ali is heredsfasfad </h2>
#         <h3>Ali is heredsfasfad </h3>
#         <h4>Ali is heredsfasfad </h4>
#         <h5>Ali is heredsfasfad </h5>
#         <h6>Ali is heredsfasfad </h6>
#         <button type='button' class='btn btn-primart'>button</div>
#       </div>
#     </div>
#   </div>
# </div>"
# debugger
      find_page = ShopifyAPI::Page.where(title: "Brands")
      unless find_page.any?
      @create_new_page = ShopifyAPI::Page.create(title: "Brands", body_html: brands_page)
         
      end

     # @assets   = ShopifyAPI::Asset.find(:all)
     # @asset = ShopifyAPI::Asset.create(key: 'templates/page.brands-2.liquid',
     #  value: brands_page)
  end

  def help
  end

  def pricing
  end

  # def get_content
  #  debugger
  #  initiate_shopify_session
  #  if @shop.vendors.any?
  #     @vendors = @shop.vendors
  #  end
  #  respond_to do |format|
  #       format.html # index.html.erb
  #       format.xml # index.xml.erb
  #   end
  # end

  private

   def find_shop
      @shop = Shop.find_by(shopify_domain: @current_shop.domain)
   end
end