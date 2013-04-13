Robovacuum::Application.routes.draw do
  
  root :to => "products#index"
  
  match "home" => "products#home", :via => :get, :as => "home"
  match "about" => "abouts#show", :via => :get, :as => "about"
  match "contact" => "products#contact", :via => :get, :as => "contact"
  match "search" => "products#search", :via => :post, :as => "search"
  match "add_cart" => "products#add_cart", :via => :post, :as => "add_cart"
  match "empty_cart" => "products#empty_cart", :via => :get, :as => "empty_cart"
  match "show_cart" => "products#show_cart", :via => :get, :as => "show_cart"
  match "check_out" => "products#check_out", :via => :get, :as => "check_out"
  match "sign_in" => "products#sign_in", :via => :post, :as => "sign_in"
  
  match "new_order" => "orders#new", :via => :get, :as => "new_order"
  match "create_order" => "orders#create", :via => :post, :as => "create_order"
  match "show_order" => "orders#show", :via => :get, :as => "show_order"
  
  resources :products
  resources :customers
  resources :abouts
  
  get "admin" => "admin/products#index"
  namespace :admin do 
    resources :products, :provinces, :customers, :abouts
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
