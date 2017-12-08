class AnalisiTecnicaTitoloController < ApplicationController
  
  before_action :current_user, only: [:index, :show]
    
  
      
    def index
      @user = User.find_by_email($user_email)    
      @isin = params[:isin] ? params[:isin] : nil 
        
      if @isin    
        @stock = Stock.find_by isin: @isin  
        @urls = Url.find_by isin: @isin   
        @cod = @stock.cod
        
        @lastRelatedPost = Post.find_by stock: @cod + ".MI"
        
        @analisis = Analysis.find_by isin: @isin   
        @studiesSize = @stock.studies.size 
        @lastStudy = @stock.studies.last
        
        
        @urlBorsaItaliana = @urls.url1
        @urlBorsaItaliana2 = @urls.url2   
              
        @urlSole24Ore = @urls.url3 
              
        @urlLaRepubblica = @urls.url6 
        @urlLaRepubblica2 = @urls.url8 
             
        @urlInvesting = @urls.url7 
             
        @urlMilanoFinanza = @urls.url9
        @urlMilanoFinanza2 = @urls.url10
              
        @urlSoldiOnLine = @urls.url5
        
        
        #Chart image
        #@urlchartImage = 'http://indici.soldionline.it/ComboChart.aspx?Codice=' + @isin  + '&TimeRange=360&ChartSize=M&Volume=1&VGrid=1&HGrid=1&ChartType=0&Band=-1&avgType1=N&movAvg1=10&avgType2=N&movAvg2=25&Indicator1=CCI&Indicator2=None&Indicator3=None&Indicator4=None&MID=&SymbolName=' + @stock.name + '&TenYears=0'
      else 
        @stocksJoint = Stock.select("stocks.*, analyses.*").joins(:analysis)
        @stocks = @stocksJoint.select("name, last_price, variation, xxivore_shorttrend").where("xxivore_shorttrend = ?", "molto rialzista").order(:name)
      end

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
    
    
    #D
    def d_amico
    end
    
    def dada
    end
    
    def damiani
    end
    
    def danieli_e_c
    end
    
    def datalogic
    end
    
    def de_longhi
    end
    
    def dea_capital
    end
    
    def diasorin
    end
    
    def digital_bros
    end
    
    def dobank
    end
    
    
    #E
    def edison_rsp
    end
    
    def eems
    end
    
    def ei_towers
    end
    
    def el_en_
    end
    
    def elica
    end
    
    def emak
    end
    
    def enav
    end
    
    def enervit
    end
    
    def eprice
    end
    
    def erg
    end
    
    def ergycapital
    end
    
    def esprinet
    end
    
    def eukedos
    end
    
    def eurotech
    end
    
    def exprivia
    end
    
    
    #F
    def falk_renewables
    end
    
    def fidia
    end
    
    def fiera_milano
    end
    
    def fila
    end
    
    def fincantieri
    end
    
    def fnm
    end
    
    
    #G
    def gabetti
    end
    
    def gas_plus
    end
    
    def gedi_gruppo_editoriale
    end
    
    def gefran
    end
    
    def geox
    end
    
    def gequity
    end
    
    def gruppo_ceramiche_ricchetti
    end
    
    def gruppo_waste_italia
    end
    
    
    #H
    def hera
    end  
    
    
    #I
    def i_grandi_viaggi
    end
    
    def igd_siiq
    end
    
    def il_sole_24_ore
    end
    
    def ima
    end
    
    def immsi
    end
    
    def indel_b
    end
    
    def industria_e_innovazione
    end
    
    def intek_group
    end
    
    def interpump_group
    end
    
    def inwit
    end
    
    def irce
    end
    
    def iren
    end
    
    def isagro
    end
    
    def it_way
    end
    
    def italiaonline
    end
    
    def italmobiliare
    end
    
    
    #J
    def juventus_football_club
    end
    
    
    #K
    def k_r_energy
    end
    
    
    #L
    def la_doria
    end
    
    def landi_renzo
    end
    
    def lazio
    end
    
    def luve
    end
    
    def lventure_group
    end

    
    #M
    def m_e_c
    end
    
    def maire_tecnimont
    end
    
    def marr
    end
    
    def massimo_zanetti_beverage
    end
    
    def madiacontech
    end
    
    def mittel
    end
    
    def molmed
    end
    
    def mondadori_editore
    end
    
    def mondo_tv
    end
    
    def monrif
    end
    
    def mutuionline
    end
    
    
    #N
    def netweek
    end
    
    
    #O
    def openjobmetis
    end
    
    def ovs
    end
    
    
    #P
    def panariagroup_industrie_ceramiche
    end
    
    def parmalat
    end
    
    def piaggio_e_c
    end
    
    def pierrel
    end
    
    def pininfarina
    end
    
    def piquadro
    end
    
    def poligrafica_s_faustino
    end
    
    def poligrafici_editoriale
    end
    
    def prelios
    end
    
    def prima_industrie
    end
    
    
    #R
    def rai_way
    end
    
    def ratti
    end
    
    def rcs_mediagroup
    end
    
    def reno_de_medici
    end
    
    def reply
    end
    
    def retelit
    end
    
    def risanamento
    end
    
    def roma
    end
    
    def rosss
    end
    
    
    #S
    def sabaf
    end
    
    def saes_getters
    end
    
    def safilo_group
    end
    
    def salini_impregilo
    end
    
    def saras
    end
    
    def servizi_italia
    end
    
    def sesa
    end
    
    def sias
    end
    
    def sintesi
    end
    
    def snaitech
    end
    
    def sogefi
    end
    
    def stefanel
    end
    
    
    #T
    def tamburi_investment_partners
    end
    
    def tas
    end
    
    def tachnogym
    end
    
    def tecnoinvestimenti
    end
    
    def ternienergia
    end
    
    def tesmec
    end
    
    def tiscali
    end
    
    def tod_s
    end
    
    def trevi_fin_industriale
    end
    
    def txt
    end
    
    
    #U
    def unieuro
    end
    
    
    #V
    def valsoia
    end
    
    def vianini
    end
    
    def vittoria_assicurazioni
    end
    
    
    #Z
    def zignano_vetro
    end
    
    def zucchi
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
