scope module: :front do
  root "courses#index"

  resources :courses, only: %i[index show]
end
