Ericandasmita::Application.routes.draw do

  get "fix_url"=>"rsvp#logout_redirect"

  get "travel/index"
  get "big_day/index"
  get "guestbook/index" => 'guestbook#index'
  match "guestbook/submit", to: 'guestbook#create', via: [:post]

  get "rsvp/index" => 'rsvp#index'
  get "rsvp/new" => 'rsvp#wedding_rsvp'
  get "rsvp/nyc" => 'rsvp#nyc_rsvp'
  get "rsvp/brunch" => 'rsvp#brunch_rsvp'
  get "rsvp/hotel" => 'rsvp#hotel_rsvp'
  match "rsvp/submit", to: 'rsvp#submit', via: [:post]
  match "rsvp_nyc/submit", to: 'rsvp#rsvp_nyc_submit', via: [:post]
  match "rsvp_brunch/submit", to: 'rsvp#rsvp_brunch_submit', via: [:post]
  match "rsvp_hotel/submit", to: 'rsvp#rsvp_hotel_submit', via: [:post]
  get "wedding_party/index"
  get "gallery/index"
  get "event/index"

  get "api/v1/notifications" => 'welcome#index'

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root :to => "welcome#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
