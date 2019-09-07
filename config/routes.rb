# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    root 'home#index'
    resources :resumes do
      scope module: :resumes do
        resources :answers
      end
    end
    resources :answers, only: [] do
      scope module: :answers do
        resources :comments
        resources :likes, only: %i[create destroy]
      end
    end

    namespace :account do
      resources :resumes
    end
  end
end
