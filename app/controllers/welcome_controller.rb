class WelcomeController < ApplicationController

  #before_action :require_user, only: [:index, :show]

  before_action :current_user, only: [:index, :show]
  
  def index
    @stocks = Stock.order(:name)
    @markets = Market.order(:id)
    
    @firstRowMarkets = @markets.select("*").where("name = ? OR name = ? OR name = ? OR name = ? OR name = ? OR name = ?", "FTSE MIB", "FTSE All Share", "S&P 100", "DAX 30", "CAC 40", "NASDAQ 100")
    @secondRowMarkets = @markets.select("*").where("name = ? OR name = ? OR name = ?", "GOLD", "Brent", "WTI")
    @thirdRowMarkets = @markets.select("*").where("name = ? OR name = ?", "EUR/USD", "EUR/GBP")
    
    
    
    @marketsUrlMap = { 
      "FTSE MIB" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=SPMib",
      "FTSE All Share" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=Mibtel",
      "S&P 100" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!OEX.USD",
      "DAX 30" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!DAX.XET",
      "CAC 40" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!PCAC.PAR",
      "NASDAQ 100" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!NDX.X.USD",
      "GOLD" => "http://finanza-mercati.ilsole24ore.com/quotazioni/valore-oro-oggi/main.php",
      "Brent" => "http://finanza-mercati.ilsole24ore.com/quotazione-petrolio-brent-wti/prezzo.php",
      "WTI" => "http://finanza-mercati.ilsole24ore.com/quotazione-petrolio-brent-wti/prezzo.php",
      "EUR/USD" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!EURUS.FX",
      "EUR/GBP" => "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!GBPVS.FX"
    }
    
    @marketsFlagMap = { 
          "FTSE MIB" => "italy",
          "FTSE All Share" => "italy",
          "S&P 100" => "usa",
          "DAX 30" => "germany",
          "CAC 40" => "france",
          "NASDAQ 100" => "usa",
          "GOLD" => "gold",
          "Brent" => "oil",
          "WTI" => "oil",
          "EUR/USD" => "currencies",
          "EUR/GBP" => "currencies"
        }
        
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
