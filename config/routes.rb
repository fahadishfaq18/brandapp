Rails.application.routes.draw do
  get 'custom/index'
  # get '/settings', to: 'settings#new'
  get '/get_content', to: 'home#get_content', defaults: { format: 'xml' }
  root :to => 'home#index'
  get '/help', to: 'home#help'
  get '/pricing', to: 'home#pricing'
  resources :hooks, only: [] do
    collection do
      post :delete_page
      post :get_vendors
      get  :get_content
    end
  end
  resources :vendors, only: [:index] do
  	get 'new_vendors', on: :collection
  end

  resource :settings, only: [:new, :create, :edit, :update]
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
