Rails.application.routes.draw do

  root to: 'pages#lecteur_flux_rss'
  get '/lecteur', to: 'pages#lecteur_flux_rss'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
