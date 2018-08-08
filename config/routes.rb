Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calc#index'
  resources :calc, only: [:index, :new] do
    get 'bmi', on: :collection
    get 'broca', on: :collection
    get 'kalori', on: :collection
  end
end
