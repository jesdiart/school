Rails.application.routes.draw do
  root "home#index"
  
  # https://stackoverflow.com/questions/5690406/rails-using-devise-with-single-table-inheritance
  devise_for :users, :controllers => { :sessions => 'sessions' }
  devise_for :administrators, :teachers, :students, :skip => :sessions

  resources :users, only: [:approve] do 
    patch 'approve', on: :member
  end
  resources :administrators, only: [:show]
  resources :teachers, only: [:show]
  resources :students, only: [:show]
end
