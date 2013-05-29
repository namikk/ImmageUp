Immageup::Application.routes.draw do
  resources :albums


post "sign_in" => "authentication#login"
  
  
get "sign_in" => "authentication#sign_in"
get "signed_out" => "authentication#signed_out"
get "change_password" => "authentication#change_password"
get "forgot_password" => "authentication#forgot_password"
get "new_user" => "users#new"
get "password_sent" => "authentication#password_sent"

get "adminpanel" => "users#adminpanel"

  get "authentication/change_password"

  get "authentication/forgot_password"

  get "authentication/new_user"

  get "authentication/password_sent"

  get "authentication/sign_in"

  get "authentication/signed_out"
  resources :users

  resources :assets
  #resources :sessions, only: [:new, :create, :destroy]
  
 
	match ':controller(/:action(/:id))(.:format)' 
  root :to => 'home#index'
  #match '/sessions/signin', to: 'sessions#new'
  #match '/sessions/signout', to: 'sessions#destroy', via: :delete

  #match '/signin', to: 'sessions#new'
  #match '/signout', to: 'sessions#destroy', via: :delete
  # get "sessions/login,"

  # get "sessions/home,"

  # get "sessions/profile,"

  # get "sessions/setting"

  # get "home/index"

 # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
	#map.login "login", :controller => "user_sessions", :action => "new"
#map.logout "logout", :controller => "user_sessions", :action => "destroy"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end