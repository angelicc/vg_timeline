VgTimeline::Application.routes.draw do |map|
  get "types/new"

  get "types/create"

  get "awards/new"

  get "awards/create"

  get "scores/new"

  get "scores/create"

  get "press/index"

  get "series/index"

  get "seires/index"

  devise_for :users

  #  constraints :host => /localhost/ do
  resources :games, :platforms, :developers, :publishers, :series, :press, :scores, :awards
  match "/:year" => "games#index", :as => :year, :constraints => { :year => /\d{4}/ }
  match "/list" => "games#list", :as => :games_list
  match "/recent" => "games#recent", :as => :games_recent
  match ":action" => "games#index"
  match "publishers(/:action)" => "publishers#action"
  match "games/new" => "games#create"
  #  match "application" => "games#index"
  root :to => "games#index"
  #  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "controller#action"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
