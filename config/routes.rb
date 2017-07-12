Rails.application.routes.draw do
  root 'sessions#index'
  get '/events' => 'events#events'
  get '/events/myshow' => 'events#myshow'
  get '/events/new' => 'events#new', as: :new_event
  get '/events/:id' => 'events#show', as: :event
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/events/:id/edit' => 'events#edit', as: :edit_event
  patch '/events/:id' => 'events#update'
  patch '/myshow/:id' => 'events#lists'
  get '/events/:id/delete' => 'events#destroy', as: :delete_event
  
  get '/groups' => 'groups#groups'
  get '/groups/myshow' => 'groups#myshow'
  get '/groups/new' => 'groups#new', as: :new_group
  get '/groups/:id' => 'groups#show', as: :group
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/groups/:id/edit' => 'groups#edit', as: :edit_group
  patch '/groups/:id' => 'groups#update'
  patch '/myshow/:id' => 'groups#lists'
  get '/groups/:id/delete' => 'groups#destroy', as: :delete_group
  
  get '/groups/:id/addEmail' => 'groups#addEmail', as: :addEmail_group
  get '/groups/:id/listEmail' => 'groups#listEmail', as: :listEmail_group
  get '/emails' => 'groups#index'
  post '/emails' => 'groups#createEmail', as: :createEmail_group
  
  resources :users
  resources :events
  resources :groups
  resources :emails
  
  
  
  #get '/users/logout' => 'sessions#destroy' ###
  #get '/logout' => 'sessions#destroy' ###
  #get '/logout/:id/edit/logout' => 'sessions#destroy'#, as: :logout
  #get '/users/login' => 'sessions#new' ###
  
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
