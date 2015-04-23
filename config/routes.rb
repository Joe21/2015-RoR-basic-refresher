Rails.application.routes.draw do
  root 'selections#index'
  
  resources :selections

  namespace :api, :path => "", :constrains => {:subdomain => "api" }, :defaults => {:format => :json} do
    namespace :v1 do
      get '/selections/random_meal' => 'selections#random_meal'
      resources :selections
    end
  end
end
