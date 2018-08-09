Rails.application.routes.draw do

  root 'wellcomes#index'

  resources :ingredients, only: [:index, :show]

  resources :wellcomes, only: [:index]

  get 'comments/comment_statistics/:recipe_id' => 'comments#comment_statistics'

  get 'recipes/most_commented_recipe' => 'recipes#most_commented_recipe'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :recipes  do
    resources :comments, only: [:index, :new, :create, :edit, :update, :show, :destroy, :comment_statistics]
  end

  resources :users
  resources :comments
  resources :recipes

end
