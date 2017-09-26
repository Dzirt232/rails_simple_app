Rails.application.routes.draw do
  resources :articles do
  	resources :comments
  end
  get 'articles' => 'articles#index'
  get 'tags' => 'tags#index'
  resources :tags
end
