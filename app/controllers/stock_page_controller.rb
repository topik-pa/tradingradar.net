class StockPageController < ApplicationController
    
  before_action :current_user, only: [:index, :show]
    
  def index

    isin = params[:isin] ? params[:isin] : ''  

    redirect_to controller: "analisi_tecnica_titolo", isin: isin
    
    #@user = User.find_by_email($user_email)
    #@stock = Stock.find_by isin: isin  
    #@urls = Url.find_by isin: isin
    
    #@analisis = Analysis.find_by isin: isin  
    #@studiesSize = @stock.studies.size 
    #@lastStudy = @stock.studies.last
    
    

    
    #Chart image
    #@urlchartImage = 'http://indici.soldionline.it/ComboChart.aspx?Codice=' + isin + '&TimeRange=360&ChartSize=M&Volume=1&VGrid=1&HGrid=1&ChartType=0&Band=-1&avgType1=N&movAvg1=10&avgType2=N&movAvg2=25&Indicator1=CCI&Indicator2=None&Indicator3=None&Indicator4=None&MID=&SymbolName=' + @stock.name + '&TenYears=0'
    
    
    
    #Borsa Italiana
    #@urlBorsaItaliana = @urls.url1
    #@urlBorsaItaliana2 = @urls.url2   
    #begin
    #  docBorsaItaliana = Nokogiri::HTML(open(@urlBorsaItaliana), nil, 'UTF-8')
    #  docBorsaItaliana.encoding = 'UTF-8'
    #  docBorsaItaliana.search('script', 'img').each do |elem|
    #    elem.remove
    #  end
    #  @borsaItalianaElem1 = docBorsaItaliana.at_xpath('/descendant::article[@class="l-grid__cell"][3]')
    #  @borsaItalianaElem2 = docBorsaItaliana.at_xpath('/descendant::article[@class="l-grid__cell"][2]') 
    #  if @urlBorsaItaliana2
    #    docBorsaItaliana2 = Nokogiri::HTML(open(@urlBorsaItaliana2), nil, 'UTF-8')
    #    docBorsaItaliana2.encoding = 'UTF-8'
    #    docBorsaItaliana2.search('script', 'img').each do |src|
    #      src.remove
    #    end
    #    @borsaItalianaElem3 = docBorsaItaliana2.at_xpath('/descendant::div[@class="l-grid__row"][4]')
    #  end
    #  rescue OpenURI::HTTPError => e
    #   puts 'Error retrieving url data: ' + e.message
    #end
    #Borsa Italiana
    
    
    #@urlSole24Ore = @urls.url3 
    
    #@urlLaRepubblica = @urls.url6 
    
    #@urlInvesting = @urls.url7 
    
    #@urlMilanoFinanza = @urls.url9
    #@urlMilanoFinanza2 = @urls.url10
    
    #@urlSoldiOnLine = @urls.url5 
    
    
    
  end
  
  
  #private
  #def colorClass(value)
  #  if value.to_s.include?("-")
  #          'red'
  #        else
  #          'green'
  #        end
  #end
  #helper_method :colorClass
    
    
end