# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



###Stock###
Stock.delete_all

stock_list = [
  [ "IT0001233417", "A2a"],
  [ "IT0005218380", "BAMI"],
  [ "IT0003856405", "LDO"],
  [ "IT0001479374", "LUX"],
  [ "IT0001063210", "MS"]
]

stock_list.each do |isin, name|
  Stock.create(isin: isin, name: name)
end
###Stock###


###Url###
Url.delete_all

url_list = [
  [ "IT0001233417", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it"],
  [ "IT0005218380", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005218380.html?lang=it"],
  [ "IT0003856405", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003856405.html?lang=it"],
  [ "IT0001479374", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001479374.html?lang=it"],
  [ "IT0001063210", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001063210.html?lang=it"]
]

url_list.each do |isin, url1|
  Url.create(isin: isin, url1: url1)
end
###Url###


###Market###
#Market.delete_all

#market_list = [ 
#  [ "FTSE MIB"],
#  [ "FTSE All Share"],
#  [ "S&P 100"],
#  [ "NIKKEI 225"],
#  [ "DAX 30"],
#  [ "CAC 40"],
#  [ "NASDAQ 100"],
#  [ "GOLD"],
#  [ "Brent"],
#  [ "WTI"],
#  [ "EUR/USD"],
#  [ "EUR/GBP"]
#]

#market_list.each do |name|
#  Market.create(name: name)
#end
###Market###

###Study###
Study.delete_all
###Study###


###Analysis###
Analysis.delete_all
###Analysis setup###