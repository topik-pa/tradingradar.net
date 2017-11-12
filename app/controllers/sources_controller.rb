class SourcesController < ApplicationController
   
  
  def source1
    isin = params[:isin] ? params[:isin] : ''
    urls = Url.find_by isin: isin
    @analisis = Analysis.find_by isin: isin
    
    #Borsa Italiana
      @urlBorsaItaliana = urls.url1
      @urlBorsaItaliana2 = urls.url2   
      begin
        docBorsaItaliana = Nokogiri::HTML(open(@urlBorsaItaliana), nil, 'UTF-8')
        docBorsaItaliana.encoding = 'UTF-8'
        docBorsaItaliana.search('script', 'img', 'a').each do |elem|
          elem.remove
        end
        @borsaItalianaElem1 = docBorsaItaliana.at_xpath('/descendant::article[@class="l-grid__cell"][3]').to_s
        @borsaItalianaElem2 = docBorsaItaliana.at_xpath('/descendant::article[@class="l-grid__cell"][2]').to_s
        @borsaItalianaElem4 = docBorsaItaliana.at_xpath('/descendant::article[@class="l-grid__cell"][4]').to_s
        if @urlBorsaItaliana2
          docBorsaItaliana2 = Nokogiri::HTML(open(@urlBorsaItaliana2), nil, 'UTF-8')
          docBorsaItaliana2.encoding = 'UTF-8'
          docBorsaItaliana2.search('script', 'img', 'a').each do |src|
            src.remove
          end
          @borsaItalianaElem3 = docBorsaItaliana2.at_xpath('//article[contains(@class,"l-grid")][2]/div[contains(@class,"-pfull")]').to_s
          
        end
        rescue OpenURI::HTTPError => e
         puts 'Error retrieving url data: ' + e.message
      end
      #Borsa Italiana
      
    render html: ('<div id="source-container">' + @borsaItalianaElem1 + @borsaItalianaElem2 + @borsaItalianaElem3 + @borsaItalianaElem4 + '</div>').html_safe
      
  end

  
  def source2
    isin = params[:isin] ? params[:isin] : ''
    urls = Url.find_by isin: isin
    @analisis = Analysis.find_by isin: isin
    
    #Il sole 24 ore
    @urlSole24Ore = urls.url3   
    begin
      if !@urlSole24Ore.blank?
        docSole24Ore = Nokogiri::HTML(open(@urlSole24Ore), nil, 'UTF-8')
        docSole24Ore.encoding = 'UTF-8'
        docSole24Ore.search('script', 'a').each do |elem|
          elem.remove
        end
        docSole24Ore.xpath('//img[contains(@src,"images2010")]').remove  
        @sole24OreElem1 = '<h3>Anagrafica</h3>' + docSole24Ore.at_xpath('/descendant::table[@class="boxDati_G3"][4]').to_s.html_safe
        @sole24OreElem2 = '<h3>Indici borsistici e redditivit&agrave;</h3>' + docSole24Ore.at_xpath('/descendant::table[@class="boxDati_G3"][6]').to_s.html_safe   
        @sole24OreElem3 = '<h3>Sintesi bilancio</h3>' + docSole24Ore.at_xpath('/descendant::div[@class="xpie6fix"][3]').to_s.html_safe
        @sole24OreElem4 = '<h3>Sintesi analisi tecnica</h3>' + docSole24Ore.at_xpath('/descendant::div[@class="xpie6fix"][4]').to_s.html_safe
      end      
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Il sole 24 ore
    
    render html: ('<div id="source-container">' + '<div class="pr-content">' + @sole24OreElem1 + '</div>' + '<div class="pr-content">' + @sole24OreElem2 + '</div>' + '<div class="pr-content">' + @sole24OreElem3 + '</div>' + '<div class="pr-content">' + @sole24OreElem4 + '</div>' + '</div>').html_safe 
        
  end

  def source3
    isin = params[:isin] ? params[:isin] : ''
    urls = Url.find_by isin: isin
    @analisis = Analysis.find_by isin: isin
    
    #La Repubblica
    @urlLaRepubblica = urls.url6 
    @urlLaRepubblica2 = urls.url8
    begin
      if !@urlLaRepubblica.blank?
        docLaRepubblica = Nokogiri::HTML(open(@urlLaRepubblica), nil, 'UTF-8')
        docLaRepubblica.encoding = 'UTF-8'
        docLaRepubblica.search('script', 'a').each do |elem|
          elem.remove
        end
        @laRepubblicaElem1 = docLaRepubblica.at_xpath('/descendant::div[@class="box-bottom"]').to_s
        @laRepubblicaRangeValue = docLaRepubblica.at_xpath('/descendant::div[@class="TLB-range-indicator"]/@style').to_s.delete('rightleft:;').to_s
      end 
      
      if !@urlLaRepubblica2.blank?
        docLaRepubblica2 = Nokogiri::HTML(open(@urlLaRepubblica2), nil, 'UTF-8')
        docLaRepubblica2.encoding = 'UTF-8'
        docLaRepubblica2.search('script').each do |src|
          src.remove
        end
        @laRepubblicaElem2 = docLaRepubblica2.at_xpath('/descendant::div[@class="boxes-container"]').to_s             
      else 
      @laRepubblicaElem2 = ''
      end
                   
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #La Repubblica 
    
    render html: ('<div id="source-container">' + @laRepubblicaElem1  + '<span>Range value di oggi: </span><span class="bold">' + @laRepubblicaRangeValue + @laRepubblicaElem2 + '</span></div>').html_safe
    
  end

  def source4
    isin = params[:isin] ? params[:isin] : ''
    urls = Url.find_by isin: isin
    @analisis = Analysis.find_by isin: isin
    
    #Investing.com
    @urlInvesting = urls.url7 
    begin
      if !@urlInvesting.blank?
        docInvesting = Nokogiri::HTML(open(@urlInvesting), nil, 'UTF-8')
        docInvesting.encoding = 'UTF-8'
        docInvesting.search('script',  'img').each do |elem|
          elem.remove
        end
        @InvestingElem1 = docInvesting.at_xpath('/descendant::table[contains(@class, "technicalSummaryTbl")]').to_s
        @InvestingElem2 = docInvesting.at_xpath('/descendant::table[contains(@class, "patternTable")]').to_s
      end  
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Investing.com    
    
    render html: ('<div id="source-container">' + '<div class="pr-content">' + @InvestingElem1 + '</div>'  + '<div class="pr-content">' + @InvestingElem2 + '</div>' + '</div>').html_safe
  end

  def source5
    isin = params[:isin] ? params[:isin] : ''
    urls = Url.find_by isin: isin
    @analisis = Analysis.find_by isin: isin
    
    #Milano Finanza
    @urlMilanoFinanza = urls.url9
    @urlMilanoFinanza2 = urls.url10 
    begin
      if !@urlMilanoFinanza.blank? and !@urlMilanoFinanza2.blank?
        docMilanoFinanza = Nokogiri::HTML(open(@urlMilanoFinanza), nil, 'UTF-8')
        docMilanoFinanza2 = Nokogiri::HTML(open(@urlMilanoFinanza2), nil, 'UTF-8')
        docMilanoFinanza.encoding = 'UTF-8'
        docMilanoFinanza2.encoding = 'UTF-8'   
        docMilanoFinanza.xpath('//@style', '//@onclick').remove
        docMilanoFinanza2.xpath('//@style', '//@onclick').remove  
        docMilanoFinanza.search('script',  'img').each do |elem|
          elem.remove
        end
        docMilanoFinanza2.search('script', 'img').each do |elem|
          elem.remove
        end       
        #@milanoFinanzaElem1 = docMilanoFinanza.at_xpath('/descendant::div[contains(@class, "wborsa-box")]/div[@class="wdett-mfbox"]').to_s
        #@milanoFinanzaElem1b = docMilanoFinanza.at_xpath('/descendant::div[contains(@class, "wborsa-box")]/div[@class="fleft"]').to_s
        @milanoFinanzaElem2 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][1]').to_s
        @milanoFinanzaElem3 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][2]').to_s
        @milanoFinanzaElem4 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][3]').to_s
        @milanoFinanzaElem5 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][4]').to_s
        @milanoFinanzaElem6 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][5]').to_s
        @milanoFinanzaElem7 = docMilanoFinanza.at_xpath('//descendant::div[@class="news"][6]').to_s
        @milanoFinanzaElem8 = docMilanoFinanza2.at_xpath('/descendant::div[contains(@class, "wMax")][2]').to_s
            
      end 
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Milano Finanza    
    
    render html: ('<div id="source-container">' + '<div class="pr-content">' + @milanoFinanzaElem2 + '</div>' + '<div class="pr-content">' + @milanoFinanzaElem3 + '</div>' + '<div class="pr-content">' + @milanoFinanzaElem4 + '</div>' + '<div class="pr-content">' + @milanoFinanzaElem5 + '</div>'  + '<div class="pr-content">' + @milanoFinanzaElem6 + '</div>' + '<div class="pr-content">' + @milanoFinanzaElem7 + '</div>' + '<div class="pr-content">' + @milanoFinanzaElem8 + '</div>' + '</div>').html_safe 
  end

  def source6
    isin = params[:isin] ? params[:isin] : ''
    urls = Url.find_by isin: isin
    @analisis = Analysis.find_by isin: isin
    
    #Soldi online
    @urlSoldiOnLine = urls.url5  
    begin
      if !@urlSoldiOnLine.blank?
        docSoldiOnLine = Nokogiri::HTML(open(@urlSoldiOnLine), nil, 'UTF-8')
        docSoldiOnLine.encoding = 'UTF-8'
        docSoldiOnLine.search('script').each do |elem|
          elem.remove
        end
        @docSoldiOnLineElem1 = docSoldiOnLine.at_xpath('//descendant::div[@class="dati"][1]').to_s
        @docSoldiOnLineElem2 = docSoldiOnLine.at_xpath('//descendant::div[@class="fond"][1]').to_s
        @docSoldiOnLineElem3 = docSoldiOnLine.at_xpath('//descendant::div[@id="lista-ultimenews"][1]').to_s
        @docSoldiOnLineElem4 = '<h3>Raccomandazioni degli analisti</h3>' +  docSoldiOnLine.at_xpath('//descendant::table[@class="tabellaDati"][1]').to_s.html_safe
        @docSoldiOnLineElem5 = docSoldiOnLine.at_xpath('//descendant::div[@class="legenda"][1]').to_s

      end      
      rescue OpenURI::HTTPError => e
       puts 'Error retrieving url data: ' + e.message
    end
    #Soldi online    
    
    render html: ('<div id="source-container">' + '<div class="pr-content f-left">' + @docSoldiOnLineElem1 + '</div>'  + '<div class="pr-content f-left">' + @docSoldiOnLineElem2 + '</div>' + '<div class="pr-content f-right">' + @docSoldiOnLineElem3 + '</div>'  + ('<div class="pr-content clear">' + @docSoldiOnLineElem4 + '</div>').html_safe + @docSoldiOnLineElem5 + '</div>').html_safe
      
  end
end
