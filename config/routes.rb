SampleApp::Application.routes.draw do

  post "periods/change", as: :change_periods

  resources :translinks
  resources :demandsites
  resources :supplysites
  resources :sites

  resources :products
  resources :machines
  resources :periods
  resources :product_periods
  resources :product_products
  resources :product_machines
  resources :machine_periods
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/transport_start', to: 'static_pages#transport_start'
  match '/mlclsp_start', to: 'static_pages#mlclsp_start'


  match 'translinks/read_and_show_ofv', :to => 'translinks#read_and_show_ofv'
  match 'translinks/read_transportation_quantities', :to => 'translinks#read_transportation_quantities'
  match 'translinks/optimize', :to => 'translinks#optimize'
  match 'translinks/delete_transportation_quantities', :to => 'translinks#delete_transportation_quantities'

  match 'product_periods/read_and_show_ofv', :to => 'product_periods#read_and_show_ofv'
  match 'product_periods/read_optimization_results', :to => 'product_periods#read_optimization_results'
  match 'product_periods/optimize', :to => 'product_periods#optimize'
  match 'product_periods/delete_old_plan', :to => 'product_periods#delete_old_plan'
  match 'product_periods/show_index_page', :to => 'product_periods#show_index_page'





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
