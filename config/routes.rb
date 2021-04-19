# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "pages#home"

  shallow do
    resources :projects, only: :index
    resources :users, only: :index
  end
end
