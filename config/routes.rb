Rails.application.routes.draw do
  get  '/checkout', to: 'pages#checkout'
  post '/single_payment', to: 'pages#single'
  post '/subscribe_payment', to: 'pages#subscribe'
  get  '/confirmation', to: 'pages#confirmation'
  root 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
