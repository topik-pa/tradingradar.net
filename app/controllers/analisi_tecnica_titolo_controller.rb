class AnalisiTecnicaTitoloController < ApplicationController
  
  before_action :current_user, only: [:index, :show]
    
  
      
    def index
      @user = User.find_by_email($user_email)
              
      isin = params[:isin] ? params[:isin] : ''     
      @stock = Stock.find_by isin: isin  
      @urls = Url.find_by isin: isin
      
      @analisis = Analysis.find_by isin: isin  
      @studiesSize = @stock.studies.size 
      @lastStudy = @stock.studies.last
      
      #Chart image
      @urlchartImage = 'http://indici.soldionline.it/ComboChart.aspx?Codice=' + isin + '&TimeRange=360&ChartSize=M&Volume=1&VGrid=1&HGrid=1&ChartType=0&Band=-1&avgType1=N&movAvg1=10&avgType2=N&movAvg2=25&Indicator1=CCI&Indicator2=None&Indicator3=None&Indicator4=None&MID=&SymbolName=' + @stock.name + '&TenYears=0'
            
      @urlBorsaItaliana = @urls.url1
      @urlBorsaItaliana2 = @urls.url2   
      
      @urlSole24Ore = @urls.url3 
      
      @urlLaRepubblica = @urls.url6 
      
      @urlInvesting = @urls.url7 
      
      @urlMilanoFinanza = @urls.url9
      @urlMilanoFinanza2 = @urls.url10
      
      @urlSoldiOnLine = @urls.url5

    end
    
    #FTSE MIB
    def a2a
    end
    
    def atlantia
    end
    
    def azimut
    end
    
    def banca_generali
    end
    
    def banca_mediolanum
    end
    
    def banco_bpm
    end
    
    def bper_banca
    end
    
    def brembo
    end
    
    def buzzi_unicem
    end
    
    def campari
    end
    
    def cnh_industrial
    end
    
    def enel
    end
    
    def eni
    end
    
    def exor
    end
    
    def ferrari
    end
    
    def fiat_chrysler_automobiles
    end
    
    def finecobank
    end
    
    def generali
    end
    
    def intesa_sanpaolo
    end
    
    def italgas
    end
    
    def leonardo
    end
    
    def luxottica
    end
    
    def mediaset
    end
    
    def mediobanca
    end
    
    def moncler
    end
    
    def poste_italiane
    end
    
    def prysmian
    end
    
    def recordati
    end
    
    def saipem
    end
    
    def salvatore_ferragamo
    end
    
    def snam
    end
    
    def stmicroelectronics
    end
    
    def telecom_italia
    end
    
    def tenaris
    end
    
    def terna_rete_elettrica_nazionale
    end
    
    def ubi_banca
    end
    
    def unicredit
    end
    
    def unipol
    end
    
    def unipolsai
    end
    
    def yoox_net_a_porter_group
    end
    
    #A
    def acea
    end
    
    def acotel_group
    end
    
    def acsm_agam
    end
    
    def aedes
    end
    
    def aeffe
    end
    
    def aeroporto_guglielmo_marconi
    end
    
    def alerion_cleanpower
    end
    
    def ambienthesis
    end
    
    def amplifon
    end
    
    def anima_holding
    end
    
    def ansaldo_sts
    end
    
    def ascopiave
    end
    
    def astaldi
    end
    
    def astm
    end
    
    def autogrill
    end
    
    def autostrade_meridionali
    end
    
    def avio
    end
    
    
    #B
    def bec_speakers
    end
    
    def banca_carige
    end
    
    def banca_farmafactoring
    end
    
    def banca_finnat
    end
    
    def banca_ifis
    end
    
    def banca_intermobiliare
    end
    
    def banca_pop_sondrio
    end
    
    def banca_profilo
    end
    
    def banca_sistema
    end
    
    def banco_di_desio_e_brianza
    end
    
    def banco_di_sardegna_rsp
    end
    
    def basicnet
    end
    
    def bastogi
    end
    
    def be
    end
    
    def beghelli
    end
        
    def beni_stabili
    end
    
    def best_union_company
    end
    
    def bialetti_industrie
    end
    
    def biancamano
    end
    
    def biesse
    end
    
    def bioera
    end
    
    def brioschi
    end
    
    def brunello_cucinelli
    end
    
    def buzzi_unicem
    end
    
    
    #C
    def cad_it
    end
    
    def cairo_communication
    end
    
    def caleffi
    end
    
    def caltagirone
    end
    
    def caltagirone_edit
    end
    
    def carraro
    end
    
    def cattolica_ass
    end
    
    def cembre
    end
    
    def cementir_holding
    end
    
    def centrale_del_latte_italia
    end
    
    def cerved_information_solutions
    end
    
    def cir
    end
    
    def class_editori
    end
    
    def cofide
    end
    
    def coima_res
    end
    
    def cia
    end
    
    def conafi_prestito
    end
    
    def credem
    end
    
    def credito_valtellinese
    end
    
    def csp_international
    end
    
    
    
    private
    def colorClass(value)
      if value.to_s.include?("-")
              'red'
            else
              'green'
            end
    end
    helper_method :colorClass
      
    
end
