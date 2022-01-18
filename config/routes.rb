Rails.application.routes.draw do
  resources :mains do
    collection do
      get :geojson, path: "api/v1/geojson", defaults: {format: :json}
    end
  end

  root to: "mains#welcome"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
