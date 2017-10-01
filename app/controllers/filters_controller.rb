class FiltersController < ApplicationController
  
  @@SJA = Stock.select("stocks.*, analyses.*").joins(:analysis)
  
  #@@Studies = Study.select("*").where("user_id = ?", $user)
  
  ##@@test = Study.where("user_id = ?", 1).group('"id"').having('updated_at = MAX(updated_at)')
  
  @@SJS = Stock.select("stocks.*, studies.*").joins(:studies).where("user_id = ?", $user_id)
  
  
  #Channels brakes all
  def filter_overAllResistancesStocks
    @overAllResistancesStocks = @@SJA.select("stocks.isin, name, last_price, borsa_italiana_resistance, xxivore_resistance, repubblica_resistance").where("last_price > borsa_italiana_resistance AND last_price > xxivore_resistance AND last_price > repubblica_resistance")    
    render json: @overAllResistancesStocks
  end
  
  def filter_belowAllSupportsStocks      
    @belowAllSupportsStocks = @@SJA.select("stocks.isin, name, last_price, borsa_italiana_support, xxivore_support, repubblica_support").where("last_price < borsa_italiana_support AND last_price < xxivore_support AND last_price < repubblica_support")
    render json: @belowAllSupportsStocks  
  end
  
  
  #Channels brakes Borsa Italiana
  def filter_overResistanceBorsaItaliana
    @overResistanceStocksBorsaItaliana = @@SJA.select("stocks.isin, name, last_price, borsa_italiana_resistance").where("last_price > borsa_italiana_resistance")    
    render json: @overResistanceStocksBorsaItaliana
  end
    
  def filter_belowSupportBorsaItaliana
    @belowSupportStocksBorsaItaliana = @@SJA.select("stocks.isin, name, last_price, borsa_italiana_support").where("last_price < borsa_italiana_support")    
    render json: @belowSupportStocksBorsaItaliana
  end 
  
  
  #Channels brakes Sole 24 Ore
  def filter_overResistanceSoleXXIVOre
    @overResistanceStocksSolexxivore = @@SJA.select("stocks.isin, name, last_price, xxivore_resistance").where("last_price > xxivore_resistance")    
    render json: @overResistanceStocksSolexxivore
  end
    
  def filter_belowSupportSoleXXIVOre
    @belowSupportStocksSolexxivore = @@SJA.select("stocks.isin, name, last_price, xxivore_support").where("last_price < xxivore_support")    
    render json: @belowSupportStocksSolexxivore
  end
    
    
  #Channels brakes Repubblica
  def filter_overResistanceRepubblica
    @overResistanceStocksRepubblica = @@SJA.select("stocks.isin, name, last_price, repubblica_resistance").where("last_price > repubblica_resistance")    
    render json: @overResistanceStocksRepubblica
  end
  
  def filter_belowSupportRepubblica
    @belowSupportStocksRepubblica = @@SJA.select("stocks.isin, name, last_price, repubblica_support").where("last_price < repubblica_support")    
    render json: @belowSupportStocksRepubblica
  end
    
    
  #Suggestions Sole 24 Ore
  def filter_suggestionsSoleXXIVOre
    @suggestionsFromSole24Ore = @@SJA.select("stocks.isin, name, last_price, xxivore_shorttrend, xxivore_ftaindex, xxivore_rsi").where("xxivore_shorttrend = ? AND xxivore_ftaindex > ? AND xxivore_rsi > ?", "molto rialzista", 50, 75)
    render json: @suggestionsFromSole24Ore
  end

  #Suggestions Investing Dot Com
  def filter_suggestionsInvestingDotCom
    @suggestionsFromInvestingDotCom = @@SJA.select("stocks.isin, name, last_price, investing_dotcomrating").where("investing_dotcomrating = ?", true)
    render json: @suggestionsFromInvestingDotCom
  end
  
  #Suggestions Milano Finanza
  def filter_suggestionsMilanoFinanza
    @suggestionsFromMilanoFinanza = @@SJA.select("stocks.isin, name, last_price, milano_finanza_risk, milano_finanza_rating").where("milano_finanza_risk <= ? AND milano_finanza_rating like ? OR milano_finanza_rating like ?", 25, "%B%", "%A%")
    render json: @suggestionsFromMilanoFinanza
  end 
  

  #Filter based on Studies
  def filter_overResistanceStocksOnStudy
    @overResistanceStocksOnStudy = @@SJS.select("isin, name, last_price, resistance").where("last_price > resistance")
    render json: @overResistanceStocksOnStudy
  end
  
  def filter_belowSupportStocksOnStudy      
      @belowSupportStocksOnStudy = @@SJS.select("isin, name, last_price, resistance").where("last_price < support")         
      render json: @belowSupportStocksOnStudy     
  end 

  def filter_risingCrossingStocksOnStudy
    @risingCrossingStocksOnStudy = @@SJS.select("isin, name, last_price").where("rsi_cross = ? OR stoch_cross = ? OR macd_cross = ?", "Rising", "Rising", "Rising")   
    render json: @risingCrossingStocksOnStudy  
  end

  def filter_bullishDivergenceStocksOnStudy
    @bullishDivergenceStocksOnStudy = @@SJS.select("isin, name, last_price").where("rsi_divergence = ? OR stoch_divergence = ?", "Bullish", "Bullish")
    render json: @bullishDivergenceStocksOnStudy  
  end
  

end
