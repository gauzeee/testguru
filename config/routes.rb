Rails.application.routes.draw do

  resources :tests, shallow: true do
    resources :questions, except: :index do
      resources :answers
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
