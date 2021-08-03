class SettingsController < AuthenticatedController
  before_action :get_shop
  before_action :find_shop
  before_action :find_setting, only: %i[edit update]

  def new
  	@setting = @shop.build_setting
  end

  def create
  	@setting = @shop.build_setting(setting_params)
  	if @setting.save
  		@success = true
  	else
  		@success = false
  	end
  end

  def edit; end

  def update
  	@setting.update(setting_params)
  end

  private

  	def setting_params
  		params.require(:setting).permit(:heading_color, :layout_style, :image_width, :page_ui_option, :heading_size, :brand_color, :brand_size)	
  	end

  	def find_shop
  		@shop = Shop.find_by(shopify_domain: @current_shop.domain)
  	end

  	def find_setting
  		@setting = Setting.find(params[:id])
  	end
end
