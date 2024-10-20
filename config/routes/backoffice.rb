namespace :backoffice do
  root "courses#index"

  resources :courses do
    resources :contents, except: %i[index show]
    get "download_report", on: :collection, as: :download_report
  end
end
