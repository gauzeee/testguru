Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sing_in: :login, sing_out: :logout },
              controllers: { sessions: 'users/sessions'}

  resources :tests, only: :index, shallow: true do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests, shallow: true do
      patch :update_inline, on: :member
      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end
end
