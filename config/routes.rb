Rails.application.routes.draw do

  root 'users#index'

  post 'create/user' => 'users#createuser'

  get 'events/:id' => 'events#eventshome'

  get 'logout' => 'users#logout'

  post 'login/user' => 'users#login'

  post 'create/event' => 'events#create_event'

  get 'event/:id' => 'events#preview_event'

  post 'add_comment/:id' => 'events#add_comment'

  get 'edit/:id' => 'users#edit_user'

  patch 'edit/user/:id' => 'users#update_user'

  get 'join/:id' => 'events#rsvp_join'
  
  get 'cancel/:id' => 'events#rsvp_cancel'

  delete 'delete/:id' => 'events#delete_event'

  get 'update/:id' => 'events#update_event'

  patch 'update/event/:id' => 'events#patch_update_event'

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
