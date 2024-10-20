namespace :backoffice do
  root "courses#index"

  resources :courses do
    resources :contents, except: %i[index show]
  end
end
