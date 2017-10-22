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
  
  
  get 'analisi_tecnica_titolo/index'
  get 'analisi_tecnica_titolo/a2a'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/atlantia'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/azimut_holding'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_generali'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_mediolanum'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banco_bpm'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/bper_banca'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/brembo'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/buzzi_unicem'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/campari'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cnh_industrial'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/enel'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/eni'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/exor'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ferrari'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/fiat_chrysler_automobiles'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/finecobank'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/generali'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/intesa_sanpaolo'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/italgas'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/leonardo'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/luxottica'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/mediaset'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/mediobanca'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/moncler'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/poste_italiane'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/prysmian'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/recordati'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/saipem'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/salvatore_ferragamo'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/snam'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/stmicroelectronics'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/telecom_italia'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/tenaris'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/terna_rete_elettrica_nazionale'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ubi_banca'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/unicredit'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/unipol'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/unipolsai'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/yoox_net_a_porter_group'  => 'analisi_tecnica_titolo#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
