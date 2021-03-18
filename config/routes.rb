Rails.application.routes.draw do
  
  
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    collection { post :import }
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      
      get 'workouts/bodypart_menu'
      get 'workouts/bodypart_menu_index'
      get 'workouts/traning_menu'
      get 'workouts/traning_contents'
      get 'workouts/traning_day_contents'
      
      get 'workouts/index_bodypart'
      get 'workouts/index_menu_modal'
      
      get 'traning_menus/new_workouts'
      post 'traning_menus/new_workouts_create'
      
    end
    resources :days do
      resources :workouts do
      end
    end
    resources :traning_menus do
    end
  end
  
  
  
end