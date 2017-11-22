Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'chi_siamo/index'
  get 'chi_siamo/' => 'chi_siamo#index'

  get 'contatti/index'
  get 'contatti/' => 'contatti#index'

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
  get 'study_page/' => 'study_page#index'
  post 'study_page/index'  => 'study_page#create' 

  get 'stock_page/index'
  get 'stock_page/' => 'stock_page#index'
  

  resources :markets
  resources :studies
  resources :analyses
  resources :stocks
  resources :urls
  
  get 'welcome/index'
  get 'welcome/' => 'welcome#index'

  root 'welcome#index'

  get 'signup'  => 'users#new' 
  resources :users

  get 'login'  => 'sessions#new' 

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  
  Rails.application.routes.draw do
    #mount Ckeditor::Engine => '/ckeditor'
    #root to: "posts#index"
  
    resources :posts
  end
   
  
  #FTSE MIB
  get 'analisi_tecnica_titolo/' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/index' => 'analisi_tecnica_titolo#index'
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
  
  
  #A
  get 'analisi_tecnica_titolo/acea'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/acotel_group'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/acsm_agam'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/aedes'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/aeffe'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/aeroporto_guglielmo_marconi'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/alerion_cleanpower'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ambienthesis'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/amplifon'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/anima_holding'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ansaldo_sts'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ascopiave'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/astaldi'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/astm'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/autogrill'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/autostrade_meridionali'  => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/avio'  => 'analisi_tecnica_titolo#index'
  
  
  #B
  get 'analisi_tecnica_titolo/bec_speakers' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_carige' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_farmafactoring' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_finnat' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_ifis' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_intermobiliare' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_pop_sondrio' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_profilo' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banca_sistema' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banco_di_desio_e_brianza' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/banco_di_sardegna_rsp' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/basicnet' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/bastogi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/be' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/beghelli' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/beni_stabili' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/best_union_company' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/bialetti_industrie' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/biancamano' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/biesse' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/bioera' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/brioschi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/brunello_cucinelli' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/buzzi_unicem' => 'analisi_tecnica_titolo#index'


  #C
  get 'analisi_tecnica_titolo/cad_it' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cairo_communication' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/caleffi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/caltagirone' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/caltagirone_edit' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/carraro' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cattolica_ass' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cembre' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cementir_holding' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/centrale_del_latte_italia' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cerved_information_solutions' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cir' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/class_editori' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cofide' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/coima_res' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/cia' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/conafi_prestito' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/credem' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/credito_valtellinese' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/csp_international' => 'analisi_tecnica_titolo#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
