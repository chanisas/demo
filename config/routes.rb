Myapp::Application.routes.draw do
  resources :times, only: [:index, :new, :create]
  resources :homes, only: [:index, :new, :create] do 
    collection do
      get :search
    end
  end
end
