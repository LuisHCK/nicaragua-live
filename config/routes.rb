Rails.application.routes.draw do
  resources :coupon_redemptions
  resources :partners
  resources :partners
  resources :offer_saveds
  resources :verification_requests
  resources :verifications
  resources :invitations
  resources :partners
  resources :todos
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

  resources :categories

  devise_for :users, controllers: {registrations: "user/registrations",
    omniauth_callbacks: "user/omniauth_callbacks"}


    match 'heart',    to: 'hearts#heart', via: :post
    match 'unheart',  to: 'hearts#unheart', via: :delete
    match 'follow',   to: 'follows#follow', via: :post
    match 'unfollow', to: 'follows#unfollow', via: :delete

    match 'search', to: 'menus#search', via: :get
    match 'tools', to: 'menus#tools', via: :get

    match 'admin_panel', to: 'menus#admin_panel', via: :get
    match 'post_category', to: 'menus#post_category', via: :post
    match 'install', to:'menus#install', via: :get

    match 'redeem', to: 'coupon_redemptions#create',  via: :post
    match 'exchange', to: 'coupon_redemptions#update',  via: :patch

    match 'close_todo', to: 'todos#close', via: :patch
    match 'open_todo', to: 'todos#close', via: :patch


    match 'bienvenido', to: 'menus#user_welcome', via: :get
    match 'myprofile', to: 'menus#myprofile', via: :get

    match 'partners_info', to: 'profiles#info', via: :get

    match 'favorites', to: 'welcome#favorites', via: :get
    match 'terms', to: 'welcome#terms', via: :get
    match 'privacitypolicy', to: 'welcome#privacity', via: :get

    match 'index', to: 'welcome#index', via: :get



    match '/google13e2745398afabff.html',
    :to => proc { |env| [200, {}, ["google-site-verification: /google13e2745398afabff.html"]] }, via: :get
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
