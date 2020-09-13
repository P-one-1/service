Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  post 'users/create'
  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
