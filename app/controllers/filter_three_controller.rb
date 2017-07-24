class FilterThreeController < ApplicationController
  def filter
    @overResistanceStocks = ActiveRecord::Base.connection.select_all('SELECT stocks.isin, stocks.name, stocks.lastPrice, studies.resistance FROM stocks INNER JOIN studies ON studies.stock_id = stocks.id WHERE (stocks.lastPrice > studies.resistance) ORDER BY studies.id DESC LIMIT 1')
        
    @belowSupportStocks = ActiveRecord::Base.connection.select_all('SELECT stocks.isin, stocks.name, stocks.lastPrice, studies.support FROM stocks INNER JOIN studies ON studies.stock_id = stocks.id WHERE (stocks.lastPrice < studies.support) ORDER BY studies.id DESC LIMIT 1')
  end
end
