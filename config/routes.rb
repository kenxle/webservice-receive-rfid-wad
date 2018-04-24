Rails.application.routes.draw do
  resources :rfid_scans
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    #api
  namespace :api do
    namespace :v1 do
      resources :rfid_scans, only: [:create]
    end
  end
end
 