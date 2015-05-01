Rails.application.routes.draw do
  root 'selections#index'
  
  resources :selections

  namespace :api, :path => "/api", :constrains => {:subdomain => "api" }, :defaults => {:format => :json} do
    namespace :v1 do
    	get '/selections/index' => 'selections#index' 
      get '/selections/random_meal' => 'selections#random_meal'    
      post '/selections/random_meal_appetizer' => 'selections#random_meal_with_appetizer' 
    end
  end



end

# ############
# Rake Routes
# ############
#                                  Prefix Verb   URI Pattern                                        Controller#Action
#                                    root GET    /                                                  selections#index
#                              selections GET    /selections(.:format)                              selections#index
#                                         POST   /selections(.:format)                              selections#create
#                           new_selection GET    /selections/new(.:format)                          selections#new
#                          edit_selection GET    /selections/:id/edit(.:format)                     selections#edit
#                               selection GET    /selections/:id(.:format)                          selections#show
#                                         PATCH  /selections/:id(.:format)                          selections#update
#                                         PUT    /selections/:id(.:format)                          selections#update
#                                         DELETE /selections/:id(.:format)                          selections#destroy
#                 api_v1_selections_index GET    /api/v1/selections/index(.:format)                 api/v1/selections#index {:format=>:json, :constrains=>{:subdomain=>"api"}}
#           api_v1_selections_random_meal GET    /api/v1/selections/random_meal(.:format)           api/v1/selections#random_meal {:format=>:json, :constrains=>{:subdomain=>"api"}}
# api_v1_selections_random_meal_appetizer POST   /api/v1/selections/random_meal_appetizer(.:format) api/v1/selections#random_meal_with_appetizer {:format=>:json, :constrains=>{:subdomain=>"api"}}