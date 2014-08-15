Rails.application.routes.draw do
  resources :games
  # Equivalent to resources :games
  # get    '/games'          =>  'games#index'
  # get    '/games/:id'      =>  'games#show'
  # post   '/games'          =>  'games#create'
  # patch  '/games/:id'      =>  'games#update'
  # get    '/games/new'      =>  'games#new'
  # get    '/games/:id/edit' =>  'games#edit'
  # delete '/games/:id'      =>  'games#destroy'
  get 'complete' => 'games#complete', as: :complete
  get 'incomplete' => 'games#incomplete', as: :incomplete
  root 'games#index'
end
