Rails.application.routes.draw do
  # resources :posts do 
  #   resources :comments
  # end

  get 'posts', to: 'posts#index', as: 'posts'
  get 'posts/new', to: 'posts#new', as: 'new_post'
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#show', as: 'post'
  get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  patch 'posts/:id', to: 'posts#update'
  delete 'posts/:id', to: 'posts#destroy'

  root "pages#about"
  
  get 'posts/:post_id/comments', to: 'comments#index', as: 'post_comments'
  get 'posts/:post_id/comments/new', to: 'comments#new', as: 'new_post_comment' 
  post 'posts/:post_id/comments', to: 'comments#create'
  get 'posts/:post_id/comments/:id', to: 'comments#show', as: 'post_comment'
  get 'posts/:post_id/comments/:id/edit', to: 'comments#edit', as: 'edit_post_comment'
  patch 'posts/:post_id/comments/:id', to: 'comments#update'
  delete 'posts/:post_id/comments/:id', to: 'comments#destroy'

  get 'about', to: 'pages#about'
  get 'resume', to: 'pages#resume'
  get 'contact', to: 'pages#contact'

  get 'not_authorized', to: 'pages#not_authorized'

  get 'register', to: 'users#new', as: 'new_user'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'



  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # resources :users

end
