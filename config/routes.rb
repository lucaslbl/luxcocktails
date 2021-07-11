Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: :destroy

  root to: 'cocktails#index'
end
