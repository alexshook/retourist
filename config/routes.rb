Retourist::Application.routes.draw do
  root to: "pages#index"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  get "search", to: "search#index"

  devise_for :users, path_names: { :sign_up => "signup", :sign_in => "login", :index => 'users' }
  resources :users, only: [ :index, :show ] do
    member do
      get :sent_messages, :received_messages
    end
    resources :messages, only: [ :new, :create, :show ]
  end

  resources :cities, only: [ :index, :new, :create, :show, :edit, :update ]
end
