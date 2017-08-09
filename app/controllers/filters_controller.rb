class FiltersController < ApplicationController
  
  @@SJA = Stock.select("stocks.*, analyses.*").joins(:analysis)
  @@SJS = Stock.select("stocks.*, studies.*").joins(:studies)
  
  def filter_1
    @overResistanceStocks = @@SJA.select("stocks.isin, name, last_price, borsa_italiana_resistance, xxivore_resistance, repubblica_resistance").where("last_price > borsa_italiana_resistance AND last_price > xxivore_resistance AND last_price > repubblica_resistance")
    
    @belowSupportStocks = @@SJA.select("stocks.isin, name, last_price, borsa_italiana_support, xxivore_support, repubblica_support").where("last_price < borsa_italiana_support AND last_price < xxivore_support AND last_price < repubblica_support")  
  end

  def filter_2
    @suggestionsFromSole24Ore = @@SJA.select("stocks.isin, name, last_price, xxivore_shorttrend, xxivore_ftaindex, xxivore_rsi").where("xxivore_shorttrend = ? AND xxivore_ftaindex > ? AND xxivore_rsi > ?", "molto rialzista", 50, 75)
  end

  def filter_3
    @suggestionsFromInvestingDotCom = @@SJA.select("stocks.isin, name, last_price, investing_dotcomrating").where("investing_dotcomrating = ?", true)
  end

  def filter_4
    @overResistanceStocksOnStudy = @@SJS.select("isin, name, last_price, resistance").where("last_price > resistance")
    
    @belowSupportStocksOnStudy = @@SJS.select("isin, name, last_price, resistance").where("last_price < support")              
  end

  def filter_5
    @risingCrossingStocksOnStudy = @@SJS.select("isin, name, last_price").where("rsi_cross = ? OR stoch_cross = ? OR macd_cross = ?", "Rising", "Rising", "Rising")   
  end

  def filter_6
    @bullishDivergenceStocksOnStudy = @@SJS.select("isin, name, last_price").where("rsi_divergence = ? OR stoch_divergence = ?", "Bullish", "Bullish")
  end
end
