Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome
  get '/film/:filmID', to: 'welcome#film', as: "film"
  get '/planet/:planetID', to: 'welcome#planet', as: "planet"
  get '/character/:characterID', to: 'welcome#character', as: "character"
  get '/ship/:shipID', to: 'welcome#ship', as: "ship"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
