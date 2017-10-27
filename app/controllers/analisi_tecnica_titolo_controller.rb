class AnalisiTecnicaTitoloController < ApplicationController
  
  before_action :current_user, only: [:index, :show]
    
  
      
    def index
      @user = User.find_by_email($user_email)
              
      @isin = params[:isin] ? params[:isin] : nil 
      
      if @isin    
        @stock = Stock.find_by isin: @isin  
        @urls = Url.find_by isin: @isin
        
        @urlBorsaItaliana = @urls.url1
        @urlBorsaItaliana2 = @urls.url2           
        @urlSole24Ore = @urls.url3         
        @urlLaRepubblica = @urls.url6         
        @urlInvesting = @urls.url7         
        @urlMilanoFinanza = @urls.url9
        @urlMilanoFinanza2 = @urls.url10        
        @urlSoldiOnLine = @urls.url5
      
        @analisis = Analysis.find_by isin: @isin   
        @studiesSize = @stock.studies.size 
        @lastStudy = @stock.studies.last
      
        #Chart image
        @urlchartImage = 'http://indici.soldionline.it/ComboChart.aspx?Codice=' + @isin  + '&TimeRange=360&ChartSize=M&Volume=1&VGrid=1&HGrid=1&ChartType=0&Band=-1&avgType1=N&movAvg1=10&avgType2=N&movAvg2=25&Indicator1=CCI&Indicator2=None&Indicator3=None&Indicator4=None&MID=&SymbolName=' + @stock.name + '&TenYears=0'
      else 
        @stocks = Stock.order(:name)
      end
    
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