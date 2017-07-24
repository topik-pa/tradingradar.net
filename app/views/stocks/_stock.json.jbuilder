json.extract! stock, :id, :isin, :cod, :name, :sector, :lastPrice, :variation, :marketPhase, :created_at, :updated_at
json.url stock_url(stock, format: :json)
