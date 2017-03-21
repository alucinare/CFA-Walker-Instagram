Rails.application.routes.draw do
  devise_for :users
  # I had in comment the bottom line out for the rails generate devise:install to work
  devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # THIS IS THE ROUTES - it tells the request what controller to go to
  # we do this because we want to client to land on a page that is related to our project, otherwise they'd land on the
  # ruby rails home page which is the root
  root 'posts#index'

  resources :posts # this can route to 7 different countroller actions

  # THESE ARE THEM
                  #(sent from client)
#   Prefix Verb   URI Pattern               Controller#Action
#   root    GET    /                         posts#index
#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy


end
