Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'converts#index'
  post '/convert', to: 'converts#perform', defaults: { format: 'json' }
end
