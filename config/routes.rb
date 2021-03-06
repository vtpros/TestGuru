Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[index show update] do
    get :result, on: :member
  end

  resource :feedback, only: %i[show create]

  namespace :admin do
    resources :gists, only: %i[index create] do
      delete :destroy, on: :member
    end

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
