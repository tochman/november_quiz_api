Rails.application.routes.draw do
  namespace :api do
    resources :quizzes, only: [:create]
  end
end
