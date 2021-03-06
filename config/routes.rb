Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user_registrations'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :locations, param: :name do
    resources :scraps
    resources :clients, only: [:new, :create]
  end

  resources :admins, only: [:new, :create, :edit, :update, :destroy]

  get '/organizations/new', to: 'admins#new'
  resources :organizations, only: [:index, :show, :edit, :update, :destroy], param: :name do
    resources :clients, only: [:index]
    resources :facilitators
    resources :invites
  end

  resources :clients, only: [:show, :update, :destroy] do
    resources :debits, only: [:create, :destroy]
    resources :credits, only: [:new, :create]
  end

  get '/clients/:id/credits/redeem', to: 'debits#new', as: 'redeem_credits'

  get '/dashboard/admin' => 'dashboard#admin', as: 'admin_dashboard'
  get '/dashboard/facilitator' => 'dashboard#facilitator', as: 'facilitator_dashboard'

  get '/walkthrough/intro' => 'walkthrough#intro'
  get '/walkthrough/locations' => 'walkthrough#locations'
  get '/walkthrough/facilitators' => 'walkthrough#facilitators'
  get '/walkthrough/clients' => 'walkthrough#clients'
  get '/walkthrough/scraps-and-credits' => 'walkthrough#scraps_and_credits'
  get '/walkthrough/outro' => 'walkthrough#outro'

  root :to => 'welcome#index'

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
