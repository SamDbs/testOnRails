Rails.application.routes.draw do



  get 'articles', action: :read, controller: 'articles'
  get 'fluxs', action: :read, controller: 'fluxs'
  post 'fluxs', action: :create, controller: 'fluxs'
  patch 'articles/:id', action: :update, controller: 'articles'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
