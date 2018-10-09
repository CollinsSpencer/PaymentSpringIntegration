Rails.application.routes.draw do
  get  '/checkout', to: 'pages#checkout'
  root 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
