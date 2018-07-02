Rails.application.routes.draw do
  resources :courses, except: [:show]
  get 'course/:id', to: 'courses#show', as: 'course_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :notes
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#home'
end
