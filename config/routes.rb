Rails.application.routes.draw do
  root "home#index"
  
  # https://stackoverflow.com/questions/5690406/rails-using-devise-with-single-table-inheritance
  devise_for :users, :controllers => { :sessions => 'sessions' }
  devise_for :administrators, :teachers, :students, :skip => :sessions

  resources :administrators, only: [:show]
end
