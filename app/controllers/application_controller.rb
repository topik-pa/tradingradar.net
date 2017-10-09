class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  
  require 'rufus-scheduler'
  require 'json'
  
  
  class ElemNotFound < StandardError
  end
  
  class UnexpectedElemValue < StandardError
  end 
 
  $appName = 'Trading Radar'
  $appVersion = '1.0 Beta'
  $adminEmail = 'agendatrading@yahoo.com'
  $author = 'Marco Pavan'
  $authorMail = 'marcopavan.mp@gmail.com'
  $lastUpdate = Time.at(0)
  
  $user = nil
  $user_id = nil
  $user_email = nil
  $isAdmin = false
  $isLogged = false
  
  
  $maxRetryToGetUrl = 2
  $sleepTime = 2
  
  
  scheduler = Rufus::Scheduler.new

  
  puts 'Starting application: ' + $appName + '. Version: ' + $appVersion
  
  
  
  #Session related stuff
  helper_method :current_user 
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
      
      if @current_user
        $user = @current_user
        $user_id = session[:user_id]
        $user_email = @current_user.email
        $isAdmin = @current_user.email == $adminEmail
        $isLogged = true
      end
  end
  
  helper_method :reset_user    
  def reset_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 

    $user = nil
    $user_id = nil
    $user_email = nil
    $isAdmin = false
    $isLogged = false
  end

  def require_user 
    redirect_to '/login' unless current_user 
  end
  #Session related stuff
  
  
  
  #stocksWithAlert = Array.new
  
  #Send mail for those stocks that reached a critical price
  #def self.sendAlertMails
  #  puts 'Checking mail...'
  #  if !stocksWithAlert.empty?
  #    stocksWithAlert.uniq!
  #    stocksWithAlert.each { |stock|
  #      puts 'Sending mail for ' + stock.name + '...'
  #      AlertStock.simpleAlert(stock).deliver_now
  #    }
  #    stocksWithAlert.clear
  #  end
  #end
  
  
  #Restart server
  def self.restartServer
    puts 'Server restarting in 3 min...'
    restart = Rufus::Scheduler.new
    restart.in '3m' do
      at_exit { puts 'Goodbye from ' + appName }
      current_pid = Process.pid
      signal = 'SIGTERM'
      Process.kill(signal, current_pid)
    end
  end
    
  
  
  
  
  
  #Update Market table
  def self.updateMarketTable      
    url = 'http://www.ilsole24ore.com/includefinanza/box_xp/FinanzaMercatiUser/XtractData/dati_JSON.json' 
    puts 'Updating market table from ' + url
    retries = $maxRetryToGetUrl
    
    begin
      doc = open(url)
      contents = doc.read
      json = JSON.parse(contents)
      
      json["ITEM"].each do |obj|    
        objName = obj["NAME"]
        
        case objName
          when "SPMib"
            market = 'FTSE MIB'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][3]["VALUE"] + '%'        
          when "!EURUS.FX"
            market = 'EUR/USD'
            value = obj["DATA"][1]["VALUE"]
            variation = obj["DATA"][3]["VALUE"] + '%'        
          when "!GBPVS.FX"
            market = 'EUR/GBP'
            value = obj["DATA"][1]["VALUE"]
            variation = obj["DATA"][3]["VALUE"] + '%'        
          when "!DAX.XET"
            market = 'DAX 30'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][3]["VALUE"] + '%'        
          when "!PCAC.PAR"
            market = 'CAC 40'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][3]["VALUE"] + '%'        
          when "!NDX.X.USD"
            market = 'NASDAQ 100'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][3]["VALUE"] + '%'        
          when "!NI225.IND"
            market ='NIKKEI 225'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][3]["VALUE"] + '%'        
          when "GLD"
            market ='GOLD'
            value = obj["DATA"][1]["VALUE"]
            variation = obj["DATA"][2]["VALUE"] + '%'        
          when "Mibtel"
            market = 'FTSE All Share'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][4]["VALUE"] + '%'        
          when "!OEX.USD"
            market = 'S&P 100'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][4]["VALUE"] + '%'             
          when "!BRNX7.IPE"
            market = 'Brent'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][4]["VALUE"] + '%'               
          when "!WBSV7.IPE"
            market = 'WTI'
            value = obj["DATA"][2]["VALUE"]
            variation = obj["DATA"][4]["VALUE"] + '%'               
        end        
        writeInMarketTableValues(market, value, variation)
      end
      rescue JSON::ParserError => e
        puts 'Parse error:' + e.message
      rescue ElemNotFound => e
        puts 'Element not found error:' + e.message
      rescue OpenURI::HTTPError => e
        puts 'HTTP error:' + e.message
        if retries > 0
          puts "\tTrying #{retries} more times"
          retries -= 1
          sleep $sleepTime
          retry
        else
          puts "\t\tCan't get #{url}, so moving on..."
        end 
    end    
  end

  def self.writeInMarketTableValues(market, value, variation)
    if market and value and variation
      puts 'Market: ' + market +  ' Value: ' + value + ' Variation: ' + variation
      db_market = Market.find_by name: market
      db_market.value = value
      db_market.variation = variation
      db_market.save!
      db_market.reload
      puts market + ' updated'
    end
  end 
  
  
  
  
  
  #Update Stock table
  def self.updateStockTable
    stocks = Stock.order(:name)
    stocks.find_each do |row|
      retries = $maxRetryToGetUrl
      begin
        stockUpdate(row)
        rescue ElemNotFound => e
          puts 'Error element not found:' + e.message
        rescue UnexpectedElemValue => e
          puts 'Error Unexpected element value:' + e.message
        rescue TypeError => e
          puts 'Type error:' + e.message
        rescue OpenURI::HTTPError => e
          puts 'HTTP error:' + e.message
          if retries > 0
            puts "\tTrying #{retries} more times"
            retries -= 1
            sleep $sleepTime
            retry
          else
            puts "\t\tCan't get #{url}, so moving on..."
          end
      end
    end
    puts 'Stock table updated'
  end
  
  def self.stockUpdate(stock)  
    isin = stock.isin
    urls = Url.find_by isin: isin
    url = urls.url1

    puts 'Updating stock ' + isin + ' from ' + url + '.'
       
    doc = Nokogiri::HTML(open(url))
         
    cod = doc.at_xpath('/descendant::table[contains(@class, "m-table")][2]//tr[5]//span[@class="t-text -right"]/text()').to_s.strip
    name = doc.at_xpath('/descendant::h1/a/text()').to_s.strip
    sector = doc.at_xpath('/descendant::table[contains(@class, "m-table")][2]//tr[6]//span[@class="t-text -right"]/text()').to_s.strip
    last_price = doc.at_xpath('/descendant::div[@class="l-box"][5]/span[1]/strong/text()').to_s.strip
    variation = doc.at_xpath('/descendant::div[@class="l-box"][5]/span[2]/strong/text()').to_s.strip
    market_phase = doc.at_xpath('/descendant::article[@class="l-grid__cell"]/div/div/div[3]/span[1]/strong/text()').to_s.strip
    
    if last_price
      puts 'Last price: ' + last_price
      last_price = last_price.tr(",", ".").to_f.round(4)
      if last_price != 0
        stock.last_price = last_price
        puts 'Last price updated'
      else
        stock.last_price = nil
        stock.save!
        raise UnexpectedElemValue, 'last_price variable is not numeric'
      end
    else
      stock.last_price = nil
      stock.save!
      raise ElemNotFound, 'last_price variable is null'
    end
    
    if variation
      puts 'Variation : ' + variation
      variation = variation.tr(",", ".").to_f.round(2)
      stock.variation = variation
      puts 'Variation updated'
    else
      stock.variation = nil
      stock.save!
      raise ElemNotFound, 'variation variable is null'
    end
    
    if market_phase
      puts 'Market phase: ' + market_phase
      stock.market_phase = market_phase
      puts 'market_phase updated'
    else
      stock.market_phase = nil
      stock.save!
      raise ElemNotFound, 'market_phase variable is null'
    end
    
    if cod
      puts 'Cod: ' + cod
      stock.cod = cod
      puts 'Code updated'
    else
      stock.cod = nil
      stock.save!
      raise ElemNotFound, 'cod variable is null'
    end
    
    if name
      puts 'Name: ' + name
      stock.name = name
      puts 'Name updated'
    else
      stock.name = nil
      stock.save!
      raise ElemNotFound, 'name variable is null'
    end
    
    if sector
      puts 'Sector: ' + sector
      stock.sector = sector
      puts 'Sector updated'
    else
      stock.sector = nil
      stock.save!
      raise ElemNotFound, 'sector variable is null'
    end

    stock.save!
    stock.reload
  end
  #Update Stock table
  
  
   
   
  #Update Analisys table
  def self.updateAnalysisTable
    analyses = Analysis.order(:isin)

    analyses.find_each do |row|
      retries = $maxRetryToGetUrl
      begin
        analysisUpdate(row)
        rescue ElemNotFound => e
          puts 'Error element not found:' + e.message
        rescue UnexpectedElemValue => e
          puts 'Error Unexpected element value:' + e.message
        rescue TypeError => e
          puts 'Type error:' + e.message
        rescue OpenURI::HTTPError => e
          puts 'HTTP error:' + e.message
          if retries > 0
            puts "\tTrying #{retries} more times"
            retries -= 1
            sleep $sleepTime
            retry
          else
            puts "\t\tCan't get #{url}, so moving on..."
          end
      end
    end
    puts 'Analisys table updated.'
  end
  
  def self.analysisUpdate(analysis)
    isin = analysis.isin
    urls = Url.find_by isin: isin
    doc = ''
        
         
    #Borsa italiana
    if urls.url2?
      
      urlBorsaItaliana = urls.url2
      
      puts 'Updating analysis ' + analysis.isin + ' from ' + urlBorsaItaliana + '.'
       
      doc = Nokogiri::HTML(open(urlBorsaItaliana))
          
      borsa_italiana_support = doc.at_xpath('/descendant::span[contains(@class, "dato_techanalSup")]/strong/text()').to_s.strip
      borsa_italiana_resistance = doc.at_xpath('/descendant::span[contains(@class, "dato_techanalRes")]/strong/text()').to_s.strip
      borsa_italiana_fta = ''
      
      borsa_italiana_ftaAttribute = doc.at_xpath('/descendant::img[contains(@src, "rank-fta")]/@src')
      case borsa_italiana_ftaAttribute
        when /rank-fta0/
          borsa_italiana_fta = "0"
        when /rank-fta1/
          borsa_italiana_fta = "1"
        when /rank-fta2/
          borsa_italiana_fta = "2"
        when /rank-fta3/
          borsa_italiana_fta = "3"
        when /rank-fta4/
          borsa_italiana_fta = "4"
      end 
      

      if borsa_italiana_support
        puts 'Support Borsa Italiana: ' + borsa_italiana_support
        borsa_italiana_support = borsa_italiana_support.gsub(",", ".").to_f.round(4)
        analysis.borsa_italiana_support = borsa_italiana_support
      else
        analysis.borsa_italiana_support = nil
        analysis.save!
        raise ElemNotFound, 'borsa_italiana_support variable is null'
      end
      
      if borsa_italiana_resistance
        puts 'Resistance Borsa Italiana: ' + borsa_italiana_resistance
        borsa_italiana_resistance = borsa_italiana_resistance.gsub(",", ".").to_f.round(4)
        analysis.borsa_italiana_resistance = borsa_italiana_resistance
      else
        analysis.borsa_italiana_resistance = nil
        analysis.save!
        raise ElemNotFound, 'borsa_italiana_resistance variable is null'
      end
      
      if borsa_italiana_fta
        puts 'FTA Borsa Italiana: ' + borsa_italiana_fta
        analysis.borsa_italiana_fta = borsa_italiana_fta
      else
        analysis.borsa_italiana_fta = nil
        analysis.save!
        raise ElemNotFound, 'borsa_italiana_fta variable is null'
      end
      puts 'Analisys updated'
    else
        puts 'Url Borsa Italiana not available'
        analysis.borsa_italiana_support = nil
        analysis.borsa_italiana_resistance = nil
        analysis.borsa_italiana_fta = nil
    end 
    
    
    #Sole 24 Ore
    if urls.url4?
      
      urlSole24Ore = urls.url4
      
      puts 'Updating analysis ' + analysis.isin + ' from ' + urlSole24Ore + '.'
       
      doc = Nokogiri::HTML(open(urlSole24Ore))
           
      xxivore_support = doc.at_xpath('//table[@cellspacing="1px"]//td[@class="xpC6"][4]/text()').to_s.strip
      xxivore_resistance = doc.at_xpath('//table[@cellspacing="1px"]//td[@class="xpC6"][5]/text()').to_s.strip
      xxivore_shorttrend = doc.at_xpath('//table[@cellspacing="1px"]//td[@class="xpC6"][2]/text()').to_s.strip
      xxivore_ftaindex = doc.at_xpath('//table[@cellspacing="1px"]//td[@class="xpC6"][3]/text()').to_s.strip  
      xxivore_rsi = doc.at_xpath('//table[@cellspacing="1px"]//td[@class="xpC6"][6]/text()').to_s.strip
      xxivore_rsidiv = doc.at_xpath('//table[@cellspacing="1px"]//td[@class="xpC6"][7]/text()').to_s.strip
    
      if xxivore_support
        puts 'Support Sole 24 Ore: ' + xxivore_support
        xxivore_support = xxivore_support.to_f.round(4)
        analysis.xxivore_support = xxivore_support
      else
        analysis.xxivore_support = nil
        analysis.save!
        raise ElemNotFound, 'xxivore_support variable is null'
      end
      
      if xxivore_resistance
        puts 'Resistance Sole 24 Ore: ' + xxivore_resistance
        xxivore_resistance = xxivore_resistance.to_f.round(4)
        analysis.xxivore_resistance = xxivore_resistance
      else
        analysis.xxivore_resistance = nil
        analysis.save!
        raise ElemNotFound, 'xxivore_resistance variable is null'
      end        
          
      if xxivore_shorttrend
        puts 'Short trend Sole 24 Ore: ' + xxivore_shorttrend
        analysis.xxivore_shorttrend = xxivore_shorttrend
      else
        analysis.xxivore_shorttrend = nil
        analysis.save!
        raise ElemNotFound, 'xxivore_shorttrend variable is null'
      end    
         
      if xxivore_ftaindex
        puts 'FTA Index Sole 24 Ore: ' + xxivore_ftaindex
        analysis.xxivore_ftaindex = xxivore_ftaindex
      else
        analysis.xxivore_ftaindex = nil
        analysis.save!
        raise ElemNotFound, 'xxivore_ftaindex variable is null'
      end  
       
      if xxivore_rsi
        puts 'RSI Sole 24 Ore: ' + xxivore_rsi
        analysis.xxivore_rsi = xxivore_rsi
      else
        analysis.xxivore_rsi = nil
        analysis.save!
        raise ElemNotFound, 'xxivore_rsi variable is null'
      end 
         
      if xxivore_rsidiv
        puts 'RSI divergence Sole 24 Ore: ' + xxivore_rsidiv
        analysis.xxivore_rsidiv = xxivore_rsidiv
      else
        analysis.xxivore_rsidiv = nil
        analysis.save!
        raise ElemNotFound, 'xxivore_rsidiv variable is null'
      end 
      puts 'Analisys updated'
    else
      puts 'Url Sole 24 Ore not available'
      analysis.xxivore_support = nil
      analysis.xxivore_resistance = nil
      analysis.xxivore_shorttrend = nil
      analysis.xxivore_ftaindex = nil
      analysis.xxivore_rsi = nil
      analysis.xxivore_rsidiv = nil
    end    
    
    
    #Repubblica.it
    if urls.url6?
      
      urlRepubblica = urls.url6
      
      puts 'Updating analysis ' + analysis.isin + ' from ' + urlRepubblica + '.'
             
      doc = Nokogiri::HTML(open(urlRepubblica))
           
      repubblica_support = doc.at_xpath('/descendant::ul[contains(@class, "TLB-data-list")][2]/li[5]/b/text()').to_s.strip
      repubblica_resistance = doc.at_xpath('/descendant::ul[contains(@class, "TLB-data-list")][2]/li[1]/b/text()').to_s.strip
      
      if repubblica_support
        puts 'Support Repubblica.it: ' + repubblica_support
        repubblica_support = repubblica_support.gsub(",", ".").to_f.round(4)
        analysis.repubblica_support = repubblica_support
      else
        analysis.repubblica_support = nil
        analysis.save!
        raise ElemNotFound, 'repubblica_support variable is null'
      end
     
      if repubblica_resistance
        puts 'Resistance Repubblica.it: ' + repubblica_resistance
        repubblica_resistance = repubblica_resistance.gsub(",", ".").to_f.round(4)
        analysis.repubblica_resistance = repubblica_resistance
      else
        analysis.repubblica_resistance = nil
        analysis.save!
        raise ElemNotFound, 'repubblica_resistance variable is null'
      end 
      puts 'Analisys updated' 
    else
      puts 'Url Repubblica.it not available'
      analysis.repubblica_support = nil
      analysis.repubblica_resistance = nil
    end    
    
    
    #Milano Finanza
    if urls.url9?
      
      urlMilanoFinanza = urls.url9
      
      puts 'Updating analysis ' + analysis.isin + ' from ' + urlMilanoFinanza + '.'
             
      doc = Nokogiri::HTML(open(urlMilanoFinanza))
           
      milano_finanza_risk = doc.at_xpath('/descendant::div[contains(@class, "indicior")]/text()').to_s.strip
      milano_finanza_rating = doc.at_xpath('/descendant::div[contains(@class, "indici2")]/text()').to_s.strip
      
      if milano_finanza_risk
        puts 'Milano Finanza Risk: ' + milano_finanza_risk
        milano_finanza_risk = milano_finanza_risk.gsub(",", ".").to_f.round(4)
        analysis.milano_finanza_risk = milano_finanza_risk
      else
        analysis.milano_finanza_risk = nil
        analysis.save!
        raise ElemNotFound, 'milano_finanza_risk variable is null'
      end
     
      if milano_finanza_rating
        puts 'Milano Finanza Rating: ' + milano_finanza_rating
        analysis.milano_finanza_rating = milano_finanza_rating
      else
        analysis.milano_finanza_rating = nil
        analysis.save!
        raise ElemNotFound, 'milano_finanza_rating variable is null'
      end 
      
      puts 'Analisys updated' 
    else
      puts 'Url Milano Finanza not available'
      analysis.milano_finanza_risk = nil
      analysis.milano_finanza_rating = nil
    end     
    

    #Investing.com
    if urls.url7?
      
      urlInvesting = urls.url7
      
      puts 'Updating analysis ' + analysis.isin + ' from ' + urlInvesting + '.'
             
      doc = Nokogiri::HTML(open(urlInvesting))
           
      mmgClassValue = doc.at_xpath('//table[contains(@class, "technicalSummaryTbl")]//tr[1]/td[5]/@class').to_s
      mmmClassValue = doc.at_xpath('//table[contains(@class, "technicalSummaryTbl")]//tr[1]/td[6]/@class').to_s
      itgClassValue = doc.at_xpath('//table[contains(@class, "technicalSummaryTbl")]//tr[2]/td[5]/@class').to_s
      itmClassValue = doc.at_xpath('//table[contains(@class, "technicalSummaryTbl")]//tr[2]/td[6]/@class').to_s
      rgclassValue =  doc.at_xpath('//table[contains(@class, "technicalSummaryTbl")]//tr[3]/td[5]/@class').to_s
      rmclassValue =  doc.at_xpath('//table[contains(@class, "technicalSummaryTbl")]//tr[3]/td[6]/@class').to_s
      
      testText = 'red'
      resultText = mmgClassValue + mmmClassValue + itgClassValue + itmClassValue + rgclassValue + rmclassValue
      
      if resultText.include?(testText)
        analysis.investing_dotcomrating = false
      else
        analysis.investing_dotcomrating = true
      end
      puts 'Analisys updated'
    else
      puts 'Url Investing.com not available'
      analysis.investing_dotcomrating = nil
    end
    
        
    analysis.save!
    analysis.reload
  end

 
  
  
  
  
  
  #PRODUCTION
  if Rails.env.production?
    
    scheduler.cron '00 02 * * 1-5', :blocking => true do
      updateAnalysisTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 06 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      updateAnalysisTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '20 07 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 08 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
    end
    
    scheduler.cron '00 09 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
        
    scheduler.cron '00 10 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      updateAnalysisTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 11 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 12 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
        
    scheduler.cron '00 13 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 14 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 15 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 16 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      updateAnalysisTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 17 * * 1-5', :blocking => true do
      updateMarketTable
      updateStockTable
      $lastUpdate = Time.now
    end
    
    scheduler.cron '00 08 * * 6-7', :blocking => true do
      updateAnalysisTable
      $lastUpdate = Time.now
    end
        

  #DEVELOPMENT
  else
    scheduler.every '3m', :first_at => Time.now + 5 do    #first job in 5 sec...
      #updateMarketTable
      #updateStockTable
      #updateAnalysisTable    
    end   
  end
  
    
end


#Site title
module ApplicationHelper
  def title(text)
    content_for :title, text
  end
end


#Site meta tags
module ApplicationHelper
  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end
end
