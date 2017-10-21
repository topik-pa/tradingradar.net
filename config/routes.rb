Rails.application.routes.draw do
  get 'chi_siamo/index'

  get 'contatti/index'

  get 'sources/source1'

  get 'sources/source2'

  get 'sources/source3'

  get 'sources/source4'

  get 'sources/source5'

  get 'sources/source6'

  get 'trading_plan/index'

  get 'filters/filter_overAllResistancesStocks'
  get 'filters/filter_belowAllSupportsStocks'
  
  get 'filters/filter_overResistanceBorsaItaliana'
  get 'filters/filter_belowSupportBorsaItaliana'
  
  get 'filters/filter_overResistanceSoleXXIVOre'
  get 'filters/filter_belowSupportSoleXXIVOre'
  
  get 'filters/filter_overResistanceRepubblica'
  get 'filters/filter_belowSupportRepubblica'

  get 'filters/filter_suggestionsSoleXXIVOre'
  get 'filters/filter_suggestionsInvestingDotCom'
  get 'filters/filter_suggestionsMilanoFinanza'

  get 'filters/filter_overResistanceStocksOnStudy'
  get 'filters/filter_belowSupportStocksOnStudy'

  
  get 'filters/filter_trendReinforcement'
  get 'filters/filter_trendChanging'
  
  
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
