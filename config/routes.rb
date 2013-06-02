D3station::Application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}

  resources :helpers, only: [:index, :show] do
    get :twitch, on: :member
  end

  root :to => 'dashboard#show'
end
