Rails.application.routes.draw do
  resources :lectures, only: [:index]
  devise_for :users, path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'log_out' }
  resources :education_programs

  resources :courses, path: '', except: [:show] do
    put :sort, on: :collection
    resources :notes, shallow: true
  end
  get 'notes', to: 'notes#my_notes', as: 'my_notes'
  get ':id', to: 'courses#show', as: 'course_show'
 # get ':course/:lecture/notes', to: 'lecture#show', as: 'lecture_notes'
  #get ':course/notes', to: 'notes#index', as: 'course_notes'

  
  
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  # resources :notes, except: :index do
  #   member do
  #     get :toggle_status
  #   end
  # end
  #get 'notes', to: 'notes#index', as: 'notes_in_course'
  
  get 'not_commentable', to: 'notes#not_commentable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  mount ActionCable.server => '/cable'
  

  authenticated :user do
    root 'courses#index', as: :authenticated_root
  end

  root to: 'pages#home'
end
