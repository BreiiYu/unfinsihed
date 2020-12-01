Rails.application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories 
  resources :words
  resources :choices
  resources :lessons
  resources :answers
  
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'

  get '/categories/:category_id/words', to: 'words#index', as:'cataword'
  #get '/categories/:category_id/words/edit', to: 'words#edit', as:'cataword_edit'
  get '/categories/:category_id/words/new', to: 'words#new', as:'cataword_new'
  delete '/logout', to: 'sessions#destroy'
  get '/lessons/:category_id/lesson_words/', to: 'answers#new', :as => :start_lesson
  get '/lessons/:category_id/lesson_words?page=:i', to: 'answers#new', :as => :next_item
  get '/lessons/:category_id/results/', to: 'answers#show', :as => :results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
