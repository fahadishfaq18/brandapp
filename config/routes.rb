Rails.application.routes.draw do
  get 'custom/index'
  # get '/settings', to: 'settings#new'
  get '/get_content', to: 'home#get_content', defaults: { format: 'xml' }
  root :to => 'home#index'
  get '/help', to: 'home#help'
  get '/pricing', to: 'home#pricing'
  post 'upload_logo_image', to: 'vendors#upload_logo_image'
  
  resources :hooks, only: [] do
    collection do
      post :delete_page
      post :get_vendors
    end
  end
  resources :vendors, only: [:index, :update] do
  	get 'new_vendors', on: :collection
  	member do 
  	get 'feature_brand'
  	get 'update_vendor'
  	end
  end

  resource :settings, only: [:new, :create, :edit, :update]
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
