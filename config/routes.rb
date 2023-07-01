RainbowVital::Engine.routes.draw do
  resources :supplements
  resources :brand_supplements
  resources :supplement_plans do
    collection do
      get :ten_day_list
    end
  end
  resources :supplement_logs, only: [:create, :destroy]
end
