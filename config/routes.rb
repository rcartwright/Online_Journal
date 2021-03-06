Rails.application.routes.draw do

 root 'home#index'

  get 'home/index'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'blogs' => 'blogs#index', :as => :blog_index
  get 'blogs/new' => 'blogs#new', :as => :new_blog
  get ':id/edit' => 'blogs#edit', :as => :edit_blog
  get ':id/edit/password' => 'blogs#password', :as => :edit_password
  get 'users' => 'users#index', :as => :user_index
  get ':blog_id/posts/:month/:year' => 'posts#month', :as => :month_index

  resources :blogs, :path => '' do
    resources :posts, :path => '' do
      resources :comments
    end
    resources :styles
    resources :users
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



#get ':id' => 'blogs#show', :as => :blog_index
#get ':id/posts/:id' => 'posts#show', :as => :blog_post
#get ':id/posts/:id/edit' => 'posts#edit', :as => :edit_blog_post

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
