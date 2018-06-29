Rails.application.routes.draw do
  resources :courses
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
