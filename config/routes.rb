Rails.application.routes.draw do
  root "home#index"
  
  # https://stackoverflow.com/questions/5690406/rails-using-devise-with-single-table-inheritance
  devise_for :users, :controllers => { :sessions => 'sessions' }
  devise_for :administrators, :teachers, :students, :skip => :sessions, :controllers => { :registrations => 'registrations' }

  resources :users, only: [:approve] do 
    patch 'approve', on: :member
  end
  resources :administrators, only: [:show] do 
    get 'home', on: :member
  end 
  resources :teachers, only: [:show] do 
    get 'home', on: :member
  end 
  resources :students, only: [:show] do 
    get 'home', on: :member
  end 

  resources :subjects do 
    resources :seminars
    resources :attendees
    resources :tests do
      resources :results
    end
  end
  
end
