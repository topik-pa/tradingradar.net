Rails.application.routes.draw do
  get 'guida_analisi_tecnica/index'

  get 'guida_analisi_tecnica/leFasiDelMercato'

  get 'guida_analisi_tecnica/ilTrend'

  get 'guida_analisi_tecnica/laTrendline'

  get 'guida_analisi_tecnica/inversioneDiTrend'

  get 'guida_analisi_tecnica/figureGrafiche'

  get 'guida_analisi_tecnica/testaESpalla'

  get 'guida_analisi_tecnica/doppioTriploMinimoMassimo'

  get 'guida_analisi_tecnica/spike'

  get 'guida_analisi_tecnica/triangoliFlagPennantRettangoli'

  get 'guida_analisi_tecnica/candeleGiapponesi'

  get 'guida_analisi_tecnica/standardELong'

  get 'guida_analisi_tecnica/marubozu'

  get 'guida_analisi_tecnica/harami'

  get 'guida_analisi_tecnica/doji'

  get 'guida_analisi_tecnica/configurazioniCandlestick'

  get 'guida_analisi_tecnica/bullishBearishEngulfing'

  get 'guida_analisi_tecnica/morningEveningStar'

  get 'guida_analisi_tecnica/hammerShootingStar'

  get 'guida_analisi_tecnica/hangingMan'

  get 'guida_analisi_tecnica/gap'

  get 'guida_analisi_tecnica/oscillatori'

  get 'guida_analisi_tecnica/rsi'

  get 'guida_analisi_tecnica/macd'

  get 'guida_analisi_tecnica/stocastico'

  get 'guida_analisi_tecnica/bandeDiBollinger'
  #get 'xyz' => 'guida_analisi_tecnica#bandeDiBollinger'

  get 'guida_analisi_tecnica/indicatori'

  get 'guida_analisi_tecnica/medieMobili'

  get 'guida_analisi_tecnica/volumi'

  get 'guida_analisi_tecnica/ondeDiElliot'

  get 'guida_analisi_tecnica/ritracciamentiDiFibonacci'

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
  get 'guida_analisi_tecnica/index'

  get 'guida_analisi_tecnica/leFasiDelMercato'

  get 'guida_analisi_tecnica/ilTrend'

  get 'guida_analisi_tecnica/laTrendline'

  get 'guida_analisi_tecnica/inversioneDiTrend'

  get 'guida_analisi_tecnica/figureGrafiche'

  get 'guida_analisi_tecnica/testaESpalla'

  get 'guida_analisi_tecnica/doppioTriploMinimoMassimo'

  get 'guida_analisi_tecnica/spike'

  get 'guida_analisi_tecnica/triangoliFlagPennantRettangoli'

  get 'guida_analisi_tecnica/candeleGiapponesi'

  get 'guida_analisi_tecnica/standardELong'

  get 'guida_analisi_tecnica/marubozu'

  get 'guida_analisi_tecnica/harami'

  get 'guida_analisi_tecnica/doji'

  get 'guida_analisi_tecnica/configurazioniCandlestick'

  get 'guida_analisi_tecnica/bullishBearishEngulfing'

  get 'guida_analisi_tecnica/morningEveningStar'

  get 'guida_analisi_tecnica/hammerShootingStar'

  get 'guida_analisi_tecnica/hangingMan'

  get 'guida_analisi_tecnica/gap'

  get 'guida_analisi_tecnica/oscillatori'

  get 'guida_analisi_tecnica/rsi'

  get 'guida_analisi_tecnica/macd'

  get 'guida_analisi_tecnica/stocastico'

  get 'guida_analisi_tecnica/bandeDiBollinger'

  get 'guida_analisi_tecnica/indicatori'

  get 'guida_analisi_tecnica/medieMobili'

  get 'guida_analisi_tecnica/volumi'

  get 'guida_analisi_tecnica/ondeDiElliot'

  get 'guida_analisi_tecnica/ritracciamentiDiFibonacci'

    #mount Ckeditor::Engine => '/ckeditor'
    #root to: "posts#index"
  
    resources :posts
  end
  
  
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
   
  
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
  
  
  #D
  get 'analisi_tecnica_titolo/d_amico' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/dada' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/damiani' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/danieli_e_c' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/datalogic' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/de_longhi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/dea_capital' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/diasorin' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/digital_bros' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/dobank' => 'analisi_tecnica_titolo#index'
  
  
  #E
  get 'analisi_tecnica_titolo/edison_rsp' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/eems' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ei_towers' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/el_en_' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/elica' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/emak' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/enav' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/enervit' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/eprice' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/erg' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ergycapital' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/esprinet' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/eukedos' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/eurotech' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/exprivia' => 'analisi_tecnica_titolo#index'
  
  
  #F
  get 'analisi_tecnica_titolo/falk_renewables' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/fidia' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/fiera_milano' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/fila' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/fincantieri' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/fnm' => 'analisi_tecnica_titolo#index'
  
  
  #G
  get 'analisi_tecnica_titolo/gabetti' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/gas_plus' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/gedi_gruppo_editoriale' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/gefran' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/geox' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/gequity' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/gruppo_ceramiche_ricchetti' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/gruppo_waste_italia' => 'analisi_tecnica_titolo#index'
  
  
  #H
  get 'analisi_tecnica_titolo/hera' => 'analisi_tecnica_titolo#index'
  
  
  #I
  get 'analisi_tecnica_titolo/i_grandi_viaggi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/igd_siiq' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/il_sole_24_ore' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ima' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/immsi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/indel_b' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/industria_e_innovazione' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/intek_group' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/interpump_group' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/inwit' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/irce' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/iren' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/isagro' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/it_way' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/italiaonline' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/italmobiliare' => 'analisi_tecnica_titolo#index'
  
  
  #J
  get 'analisi_tecnica_titolo/juventus_football_club' => 'analisi_tecnica_titolo#index'
  
  
  #K
  get 'analisi_tecnica_titolo/k_r_energy' => 'analisi_tecnica_titolo#index'
  
  
  #L
  get 'analisi_tecnica_titolo/la_doria' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/landi_renzo' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/lazio' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/luve' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/lventure_group' => 'analisi_tecnica_titolo#index'
  
  
  #M
  get 'analisi_tecnica_titolo/m_e_c' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/maire_tecnimont' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/marr' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/massimo_zanetti_beverage' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/madiacontech' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/mittel' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/molmed' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/mondadori_editore' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/mondo_tv' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/monrif' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/mutuionline' => 'analisi_tecnica_titolo#index'
  
  
  #N
  get 'analisi_tecnica_titolo/netweek' => 'analisi_tecnica_titolo#index'
  
  
  #O
  get 'analisi_tecnica_titolo/openjobmetis' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ovs' => 'analisi_tecnica_titolo#index'
  
  
  #P
  get 'analisi_tecnica_titolo/panariagroup_industrie_ceramiche' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/parmalat' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/piaggio_e_c' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/pierrel' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/pininfarina' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/piquadro' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/poligrafica_s_faustino' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/poligrafici_editoriale' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/prelios' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/prima_industrie' => 'analisi_tecnica_titolo#index'
  
  
  #R
  get 'analisi_tecnica_titolo/rai_way' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ratti' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/rcs_mediagroup' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/reno_de_medici' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/reply' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/retelit' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/risanamento' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/roma' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/rosss' => 'analisi_tecnica_titolo#index'
  
  
  #S
  get 'analisi_tecnica_titolo/sabaf' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/saes_getters' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/safilo_group' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/salini_impregilo' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/saras' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/servizi_italia' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/sesa' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/sias' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/sintesi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/snaitech' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/sogefi' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/stefanel' => 'analisi_tecnica_titolo#index'
  
  
  #T
  get 'analisi_tecnica_titolo/tamburi_investment_partners' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/tas' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/tachnogym' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/tecnoinvestimenti' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/ternienergia' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/tesmec' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/tiscali' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/tod_s' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/trevi_fin_industriale' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/txt' => 'analisi_tecnica_titolo#index'
  
  
  #U
  get 'analisi_tecnica_titolo/unieuro' => 'analisi_tecnica_titolo#index'
  
  
  #V
  get 'analisi_tecnica_titolo/valsoia' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/vianini' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/vittoria_assicurazioni' => 'analisi_tecnica_titolo#index'
  
  
  #Z
  get 'analisi_tecnica_titolo/zignano_vetro' => 'analisi_tecnica_titolo#index'
  get 'analisi_tecnica_titolo/zucchi' => 'analisi_tecnica_titolo#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
