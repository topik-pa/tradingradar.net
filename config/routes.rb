Rails.application.routes.draw do
  get 'trading_plan/index'

  get 'filters/filter_1'
  
  get 'filters/filter_1b'
  
  get 'filters/filter_1c'
  get 'filters/filter_1d'
  get 'filters/filter_1e'
  get 'filters/filter_1f'
  get 'filters/filter_1g'
  get 'filters/filter_1h'

  get 'filters/filter_2'

  get 'filters/filter_3'

  get 'filters/filter_4'
  
  get 'filters/filter_4b'

  get 'filters/filter_5'

  get 'filters/filter_6'
  
  get 'filters/filter_7'

  get 'study_page/index'
  post 'study_page/index'  => 'study_page#create' 

  get 'stock_page/index'

  resources :markets
  resources :studies
  resources :analyses
  resources :stocks
  resources :urls
  get 'welcome/index'

  root 'welcome#index'

  get 'signup'  => 'users#new' 
  resources :users

  get 'login'  => 'sessions#new' 

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  
  #resources :stocks do
   #resources :analysis
  #end
  #Da modificare anche il futuro analysis controller

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
