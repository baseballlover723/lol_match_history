Rails.application.routes.draw do
  get '/', to: 'index#index'

  get '/:region/:username', to: 'summoner#show', as: :summoner_show

  post '/', to: 'summoner#search', as: :search
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
