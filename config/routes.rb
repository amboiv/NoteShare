Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'log_out' }
  resources :education_programs
  resources :courses, except: [:show] do
    put :sort, on: :collection
  end

  get 'course/:id', to: 'courses#show', as: 'course_show'
  
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :notes, except: :index do
    member do
      get :toggle_status
    end
  end
  get 'notes', to: 'notes#index', as: 'notes_in_course'
  get 'not_commentable', to: 'notes#not_commentable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#home'
end
