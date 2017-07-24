class WelcomeController < ApplicationController

  before_action :require_user, only: [:index, :show]

  def index
    @stocks = Stock.order(:name)
    #@markets = Market.order(:id)
    
    #@market1 = @markets.find_by(name: 'FTSE MIB')
    #@market2 = @markets.find_by(name: 'FTSE All Share')
   # @market3 = @markets.find_by(name: 'S&P 100')
   # @market4 = @markets.find_by(name: 'NIKKEI 225')
   # @market5 = @markets.find_by(name: 'DAX 30')
   ## @market6 = @markets.find_by(name: 'CAC 40')
   # @market7 = @markets.find_by(name: 'NASDAQ 100')
   # @market8 = @markets.find_by(name: 'GOLD')
   # @market9 = @markets.find_by(name: 'Brent')
   # @market10 = @markets.find_by(name: 'WTI')
   # @market11 = @markets.find_by(name: 'EUR/USD')
   # @market12 = @markets.find_by(name: 'EUR/GBP')
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
