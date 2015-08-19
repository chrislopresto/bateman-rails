Rails.application.routes.draw do
  namespace :api, module: nil, defaults: { format: 'json' } do
    namespace :site, module: nil do
      namespace :v0, module: 'api/site', as: nil do
        resources :things, only: %i(create)
      end
    end
  end
end
