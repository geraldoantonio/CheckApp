Rails.application.routes.draw do

  devise_for :users, controllers: {
          sessions: 'users/sessions',
     registrations: 'users/registrations',
         passwords: 'users/passwords'
 }
  

  root 'home#index'

  resources :checks
  resources :accounts
  resources :beneficiaries
  resources :holders, except:[:show]
  resources :banks, only:[:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
