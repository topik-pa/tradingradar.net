class StockPageController < ApplicationController
  
  before_action :require_user, only: [:index, :show]
    
  def index
    
    @user = User.find_by_email(current_user.email)
    
    isin = params[:isin] ? params[:isin] : ''     
    @stock = Stock.find_by isin: isin  
    @urls = Url.find_by isin: isin
    
    @analisis = Analysis.find_by isin: isin  
    @studiesSize = @stock.studies.size 
    @lastStudy = @stock.studies.last
    
    
    
    #Borsa Italiana
    @urlBorsaItaliana = @urls.url1
    @urlBorsaItaliana2 = @urls.url2   
    begin
      docBorsaItaliana = Nokogiri::HTML(open(@urlBorsaItaliana), nil, 'ISO-8859-1')
      docBorsaItaliana.encoding = 'UTF-8'
      docBorsaItaliana.search('script', 'img').each do |elem|
        elem.remove
      end
      @borsaItalianaElem1 = docBorsaItaliana.at_xpath('/descendant::article[@class="l-grid__cell"][3]')
      @borsaItalianaElem2 = docBorsaItaliana.at_xpath('/descendant::article[@class="l-grid__cell"][2]') 
      if @urlBorsaItaliana2
        docBorsaItaliana2 = Nokogiri::HTML(open(@urlBorsaItaliana2), nil, 'ISO-8859-1')
        docBorsaItaliana2.encoding = 'UTF-8'
        docBorsaItaliana2.search('script', 'img').each do |src|
          src.remove
        end
        @borsaItalianaElem3 = docBorsaItaliana2.at_xpath('/descendant::div[@class="l-grid__row"][4]')
      end
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Borsa Italiana
    
    
    
    
    #Il sole 24 ore
    @urlSole24Ore = @urls.url3   
    begin
      if !@urlSole24Ore.blank?
        docSole24Ore = Nokogiri::HTML(open(@urlSole24Ore), nil, 'ISO-8859-1')
        docSole24Ore.encoding = 'UTF-8'
        docSole24Ore.search('script',  'img').each do |elem|
          elem.remove
        end
        @sole24OreElem1 = docSole24Ore.at_xpath('/descendant::table[@class="boxDati_G3"][4]')
        @sole24OreElem2 = docSole24Ore.at_xpath('/descendant::table[@class="boxDati_G3"][6]')    
        @sole24OreElem3 = docSole24Ore.at_xpath('/descendant::div[@class="xpie6fix"][3]')
        @sole24OreElem4 = docSole24Ore.at_xpath('/descendant::div[@class="xpie6fix"][4]')
      end      
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Il sole 24 ore
    
    
    
    
    #Investing.com
    @urlInvesting = @urls.url7 
    begin
      if !@urlInvesting.blank?
        docInvesting = Nokogiri::HTML(open(@urlInvesting), nil, 'ISO-8859-1')
        docInvesting.encoding = 'UTF-8'
        docInvesting.search('script',  'img').each do |elem|
          elem.remove
        end
        @InvestingElem1 = docInvesting.at_xpath('/descendant::table[contains(@class, "technicalSummaryTbl")]')
        @InvestingElem2 = docInvesting.at_xpath('/descendant::table[contains(@class, "patternTable")]')
      end  
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Investing.com
    
    
    
    
    
    #Milano Finanza
    @urlMilanoFinanza = @urls.url9
    @urlMilanoFinanza2 = @urls.url10 
    begin
      if !@urlMilanoFinanza.blank? and !@urlMilanoFinanza2.blank?
        docMilanoFinanza = Nokogiri::HTML(open(@urlMilanoFinanza), nil, 'ISO-8859-1')
        docMilanoFinanza2 = Nokogiri::HTML(open(@urlMilanoFinanza2), nil, 'ISO-8859-1')
        docMilanoFinanza.encoding = 'UTF-8'
        docMilanoFinanza2.encoding = 'UTF-8'       
        docMilanoFinanza.search('script',  'img').each do |elem|
          elem.remove
        end
        docMilanoFinanza2.search('script', 'img').each do |elem|
          elem.remove
        end       
        @milanoFinanzaElem1 = docMilanoFinanza.at_xpath('/descendant::div[contains(@class, "wborsa-box")]')
        @milanoFinanzaElem2 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][1]')
        @milanoFinanzaElem3 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][2]') 
        @milanoFinanzaElem4 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][3]') 
        @milanoFinanzaElem5 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][4]') 
        @milanoFinanzaElem6 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][5]') 
        @milanoFinanzaElem7 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][6]') 
        @milanoFinanzaElem8 = docMilanoFinanza2.at_xpath('/descendant::div[contains(@class, "wMax")][2]')
            
      end 
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Milano Finanza
    
    
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