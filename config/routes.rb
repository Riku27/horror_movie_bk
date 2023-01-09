Rails.application.routes.draw do
  
  root :to => "public/homes#top"
  get '/admin' => 'admin/homes#top', as: 'admin'
  get '/about' => 'public/homes#about', as: 'about'
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :movies, only: [:index, :show]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end
  
  namespace :public do
    resources :users, only: [:show, :edit, :update]
    get 'users/unsubscribe'
    patch 'users/withdraw'
    resources :movies, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    
  end
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  devise_for :user,
    path: 'public',
    controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
