Rails.application.routes.draw do
  root 'index#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :settings do
    resources :profiles, only: [:index, :create]
  end

  get '/plugin', to: 'plugin#index', as: 'plugin'
  scope path: '/new', module: :projects, controller: :project, as: 'new' do
    get  '/', to: :new
    post '/', to: :create
  end

  # v3
  scope controller: :home, path: '/:username' do
    get '/' => :index, as: 'home'
    get '/:project_name' => :project, as: 'project'

    scope module: :projects, path: '/:project_name', as: 'project' do
      get '/start' => :start
      get '/fork'  => :fork
      resource :settings, only: [:update, :destroy] do
        get :index, on: :collection
      end

      resource :editor,  only: [:update] do
        get :index, on: :collection
      end
    end
  end

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
    # concern :toggleable do
    #   post 'toggle'
    # end
    # resources :posts, concerns: :toggleable
    # resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
