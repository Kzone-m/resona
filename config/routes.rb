Rails.application.routes.draw do
  # get  'home' => 'home#index'
  # root 'home#index'

  resources :users, only: [:index], path: '/' do
    collection do
      get 'mypage'
      get 'login'
      get 'logout'
    end
  end

  namespace :my_page do
    resources :watch_list, only: [:index,  :create, :destroy]
    resources :cart, only: [:index, :create, :destroy]
    resources :selling_items, only: [:index]
  end

  namespace :marketplaces do
    resources :guitars, only: [:index]
    resources :basses, only: [:index]
    resources :keyboards, only: [:index]
  end

  resources :sell_items do
    collection do
     #get 'get_categories'
     #get 'get_product_models'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
