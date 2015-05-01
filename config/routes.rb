Rails.application.routes.draw do
  root 'selections#index'
  
  resources :selections

  namespace :api, :path => "/api", :constrains => {:subdomain => "api" }, :defaults => {:format => :json} do
    namespace :v1 do
      get '/selections/random_meal' => 'selections#random_meal'
      resources :selections
    end
  end
end

# ############
# Rake Routes
# ############
# 												 root GET    /                                        selections#index
#                    selections GET    /selections(.:format)                    selections#index
#                               POST   /selections(.:format)                    selections#create
#                 new_selection GET    /selections/new(.:format)                selections#new
#                edit_selection GET    /selections/:id/edit(.:format)           selections#edit
#                     selection GET    /selections/:id(.:format)                selections#show
#                               PATCH  /selections/:id(.:format)                selections#update
#                               PUT    /selections/:id(.:format)                selections#update
#                               DELETE /selections/:id(.:format)                selections#destroy
# api_v1_selections_random_meal GET    /api/v1/selections/random_meal(.:format) api/v1/selections#random_meal {:format=>:json, :constrains=>{:subdomain=>"api"}}
#             api_v1_selections GET    /api/v1/selections(.:format)             api/v1/selections#index {:format=>:json, :constrains=>{:subdomain=>"api"}}
#                               POST   /api/v1/selections(.:format)             api/v1/selections#create {:format=>:json, :constrains=>{:subdomain=>"api"}}
#          new_api_v1_selection GET    /api/v1/selections/new(.:format)         api/v1/selections#new {:format=>:json, :constrains=>{:subdomain=>"api"}}
#         edit_api_v1_selection GET    /api/v1/selections/:id/edit(.:format)    api/v1/selections#edit {:format=>:json, :constrains=>{:subdomain=>"api"}}
#              api_v1_selection GET    /api/v1/selections/:id(.:format)         api/v1/selections#show {:format=>:json, :constrains=>{:subdomain=>"api"}}
#                               PATCH  /api/v1/selections/:id(.:format)         api/v1/selections#update {:format=>:json, :constrains=>{:subdomain=>"api"}}
#                               PUT    /api/v1/selections/:id(.:format)         api/v1/selections#update {:format=>:json, :constrains=>{:subdomain=>"api"}}
#                               DELETE /api/v1/selections/:id(.:format)         api/v1/selections#destroy {:format=>:json, :constrains=>{:subdomain=>"api"}}