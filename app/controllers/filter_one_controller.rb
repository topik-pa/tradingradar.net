class FilterOneController < ApplicationController
  def filter
    @overResistanceStocks = ActiveRecord::Base.connection.select_all('SELECT stocks.isin, stocks.name, stocks.lastPrice, analyses.borsaItalianaResistance, analyses.xxivOreResistance, analyses.repubblicaResistance FROM stocks INNER JOIN analyses ON analyses.isin = stocks.isin WHERE (stocks.lastPrice > analyses.borsaItalianaResistance AND stocks.lastPrice > analyses.xxivOreResistance AND stocks.lastPrice > analyses.repubblicaResistance )')
    
    @belowSupportStocks = ActiveRecord::Base.connection.select_all('SELECT stocks.isin, stocks.name, stocks.lastPrice, analyses.borsaItalianaSupport, analyses.xxivOreSupport, analyses.repubblicaSupport FROM stocks INNER JOIN analyses ON analyses.isin = stocks.isin WHERE (stocks.lastPrice < analyses.borsaItalianaSupport AND stocks.lastPrice < analyses.xxivOreSupport AND stocks.lastPrice < analyses.repubblicaSupport )')
  end
end
