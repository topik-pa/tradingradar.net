json.extract! stock, :id, :isin, :cod, :name, :sector, :last_price, :variation, :market_phase, :created_at, :updated_at
json.url stock_url(stock, format: :json)
