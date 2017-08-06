class WelcomeController < ApplicationController

  before_action :require_user, only: [:index, :show]

  def index
    @stocks = Stock.order(:name)
    @markets = Market.order(:id)
    
    @firstRowMarkets = @markets.select("*").where("name = ? OR name = ? OR name = ? OR name = ? OR name = ? OR name = ?", "FTSE MIB", "FTSE All Share", "S&P 100", "DAX 30", "CAC 40", "NASDAQ 100")
    @secondRowMarkets = @markets.select("*").where("name = ? OR name = ? OR name = ?", "GOLD", "Brent", "WTI")
    @thirdRowMarkets = @markets.select("*").where("name = ? OR name = ?", "EUR/USD", "EUR/GBP")
    
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
