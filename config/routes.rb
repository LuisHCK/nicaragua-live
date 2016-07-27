Rails.application.routes.draw do
  resources :releases
  resources :cinemas
  resources :movies
  resources :coupons
  resources :surveys, :attempts
  resources :contests
  resources :valorations
  resources :items
  resources :markets
  resources :offers
  resources :menus
  resources :clientprofiles
  resources :wikis
  resources :panels
  resources :galleries
  resources :pictures

  resources :profiles do
    resources :reviews, except: [:show, :index]
  end

  resources :posts do
    resources :comments
  end

  resources :events do
    resources :event_comments
  end
  #ajax for post

  devise_for :master_admins

  resources :categories

  devise_for :users, controllers: {registrations: "user/registrations"}
  devise_for :clients, controllers: {registrations: "clients/registrations"}

  match 'heart',    to: 'hearts#heart', via: :post
  match 'unheart',  to: 'hearts#unheart', via: :delete
  match 'follow',   to: 'follows#follow', via: :post
  match 'unfollow', to: 'follows#unfollow', via: :delete

  match 'clients/:id' => 'clients#destroy', :via => :delete, :as => :admin_destroy_client

  match 'search', to: 'menus#search', via: :get
  match 'tools', to: 'menus#tools', via: :get

  match 'admin_panel', to: 'menus#admin_panel', via: :get
  match 'post_category', to: 'menus#post_category', via: :post

  match 'install', to:'menus#install', via: :get

  match 'redeem', to: 'coupon_redemptions#create',  via: :post
  match 'exchange', to: 'coupon_redemptions#update',  via: :patch

  match 'bienvenido', to: 'menus#user_welcome', via: :get

  match '/google13e2745398afabff.html',
      :to => proc { |env| [200, {}, ["google-site-verification: /google13e2745398afabff.html"]] }, via: :get
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
