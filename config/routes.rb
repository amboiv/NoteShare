Rails.application.routes.draw do
  resources :education_programs
  resources :courses, except: [:show]
  get 'course/:id', to: 'courses#show', as: 'course_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :notes do
    member do
      get :toggle_status
    end
  end
  get 'not_commentable', to: 'notes#not_commentable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#home'
end
