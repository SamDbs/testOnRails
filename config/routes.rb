Rails.application.routes.draw do

  get 'fluxs/index'
  get 'fluxs/new'
  get 'fluxs/create'
  root to: 'articles#news'

  resources :fluxs
  #resource :articles, only: [:updateFlux]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
