Rails.application.routes.draw do
  scope :back do
    resources :imports
    resources :lessons
    resources :chapters
    resources :categories
    resources :levels
  end
  devise_for :users
end
