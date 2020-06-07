Rails.application.routes.draw do
  get "/about", to: "pages#about", as: :pages_about
  get "/contact", to: "pages#contact", as: :pages_contact
  get "/", to: "pages#home", as: :pages_home
  get "/lessons", to: "pages#lessons", as: :pages_lessons
  get "/reviews", to: "pages#reviews", as: :pages_reviews
  get "/trial", to: "pages#trial", as: :pages_trial

  scope :back do
    resources :imports
    resources :lessons
    resources :chapters
    resources :categories
    resources :levels
  end

  devise_for :users
end
