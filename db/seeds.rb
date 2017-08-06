# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Analysis.delete_all
Stock.delete_all

Url.delete_all
Market.delete_all
Study.delete_all


###Stock###
stock_list = [
  [1, "IT0001233417", "", "A2a", "", nil, "", ""],
  [2, "IT0003506190", "", "Atlantia", "", nil, "", ""],
  [3, "IT0003261697", "", "Azimut Holding", "", nil, "", ""],
  [4, "IT0001031084", "", "Banca Generali", "", nil, "", ""],
  [5, "IT0004776628", "", "Banca Mediolanum", "", nil, "", ""],
  [6, "IT0005218380", "", "Banco Bpm", "", nil, "", ""],
  [7, "IT0000066123", "", "Bper Banca", "", nil, "", ""],
  [8, "IT0005252728", "", "Brembo", "", nil, "", ""],
  [9, "IT0001347308", "", "Buzzi Unicem", "", nil, "", ""],
  [10, "IT0005252207", "", "Campari", "", nil, "", ""],
  [11, "NL0010545661", "", "Cnh Industrial", "", nil, "", ""],
  [12, "IT0003128367", "", "Enel", "", nil, "", ""],
  [13, "IT0003132476", "", "Eni", "", nil, "", ""],  
  [14, "NL0012059018", "", "Exor", "", nil, "", ""],
  [15, "NL0011585146", "", "Ferrari", "", nil, "", ""],
  [16, "IT0003132476", "", "Fiat Chrysler Automobiles", "", nil, "", ""],
  [17, "IT0000072170", "", "Finecobank", "", nil, "", ""],
  [18, "IT0003132476", "", "Generali", "", nil, "", ""],
  [19, "IT0000072618", "", "Intesa Sanpaolo", "", nil, "", ""],
  [20, "IT0005211237", "", "Italgas", "", nil, "", ""],
  [21, "IT0003856405", "", "Leonardo", "", nil, "", ""],
  [22, "IT0001479374", "", "Luxottica", "", nil, "", ""],
  [23, "IT0001063210", "", "Mediaset", "", nil, "", ""],  
  [24, "IT0000062957", "", "Mediobanca", "", nil, "", ""],
  [25, "IT0004965148", "", "Moncler", "", nil, "", ""],
  [26, "IT0003796171", "", "Poste Italiane", "", nil, "", ""],
  [27, "IT0004176001", "", "Prysmian", "", nil, "", ""],
  [28, "IT0003828271", "", "Recordati", "", nil, "", ""],
  [29, "IT0005252140", "", "Saipem", "", nil, "", ""],
  [30, "IT0004712375", "", "Salvatore Ferragamo", "", nil, "", ""],
  [31, "IT0003153415", "", "Snam", "", nil, "", ""],
  [32, "NL0000226223", "", "Stmicroelectronics", "", nil, "", ""],
  [33, "IT0003497168", "", "Telecom Italia", "", nil, "", ""], 
  [34, "LU0156801721", "", "Tenaris", "", nil, "", ""],
  [35, "IT0003242622", "", "Terna - Rete Elettrica Nazionale", "", nil, "", ""],
  [36, "IT0003487029", "", "Ubi Banca", "", nil, "", ""],
  [37, "IT0005239360", "", "Unicredit", "", nil, "", ""],
  [38, "IT0004810054", "", "Unipol", "", nil, "", ""],
  [39, "IT0004827447", "", "Unipolsai", "", nil, "", ""],
  [40, "IT0003540470", "", "Yoox Net-A-Porter Group", "", nil, "", ""]
]

#Stock.create(isin: "111", name: "qqqq", last_price: "10")

stock_list.each do |id, isin, cod, name, sector, last_price, variation, market_phase|
  Stock.create(id: id, isin: isin, cod: cod, name: name, sector: sector, last_price: last_price, variation: variation, market_phase: market_phase)
end
###Stock###



###Url###
url_list = [
  [ "IT0001233417", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001233417&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003506190", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003506190.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003506190&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003261697", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003261697.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003261697&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0001031084", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001031084.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001031084&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0004776628", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004776628.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004776628&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0005218380", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005218380.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005218380&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0000066123", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000066123.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000066123&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0005252728", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005252728.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005252728&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0001347308", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001347308.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001347308&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0005252207", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005252207.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005252207&lang=it", "", "", "", "", "", "", "", ""],
  [ "NL0010545661", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0010545661.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0010545661&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003128367", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003128367.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003128367&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003132476", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003132476.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003132476&lang=it", "", "", "", "", "", "", "", ""],
  [ "NL0012059018", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0012059018.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0012059018&lang=it", "", "", "", "", "", "", "", ""],
  [ "NL0011585146", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0011585146.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0011585146&lang=it", "", "", "", "", "", "", "", ""],
  [ "NL0010877643", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0010877643.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0010877643&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0000072170", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000072170.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000072170&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0000062072", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000062072.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000062072&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0000072618", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000072618.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000072618&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0005211237", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005211237.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005211237&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003856405", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003856405.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003856405&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0001479374", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001479374.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001479374&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0001063210", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001063210.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001063210&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0000062957", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000062957.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000062957&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0004965148", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004965148.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004965148&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003796171", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003796171.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003796171&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0004176001", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004176001.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004176001&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003828271", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003828271.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003828271&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0005252140", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005252140.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005252140&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0004712375", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004712375.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004712375&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003153415", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003153415.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003153415&lang=it", "", "", "", "", "", "", "", ""],
  [ "NL0000226223", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0000226223.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0000226223&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003497168", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003497168.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003497168&lang=it", "", "", "", "", "", "", "", ""], 
  [ "LU0156801721", "http://www.borsaitaliana.it/borsa/azioni/scheda/LU0156801721.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=LU0156801721&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003242622", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003242622.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003242622&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003487029", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003487029.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003487029&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0005239360", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005239360.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005239360&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0004810054", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004810054.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004810054&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0004827447", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004827447.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004827447&lang=it", "", "", "", "", "", "", "", ""],
  [ "IT0003540470", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003540470.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003540470&lang=it", "", "", "", "", "", "", "", ""]
]

url_list.each do |isin, url1, url2, url3, url4, url5, url6, url7, url8, url9, url10|
  Url.create(isin: isin, url1: url1, url2: url2, url3: url3, url4: url4, url5: url5, url6: url6, url7: url7, url8: url8, url9: url9, url10: url10)
end
###Url###



###Market###
market_list = [ 
  [ "FTSE MIB", "", ""],
  [ "FTSE All Share", "", ""],
  [ "S&P 100", "", ""],
  [ "NASDAQ 100", "", ""],
  [ "DAX 30", "", ""],
  [ "CAC 40", "", ""],
  [ "NIKKEI 225", "", ""],
  [ "GOLD", "", ""],
  [ "Brent", "", ""],
  [ "WTI", "", ""],
  [ "EUR/USD", "", ""],
  [ "EUR/GBP", "", ""]
]

market_list.each do |name, value, variation|
  Market.create(name: name, value: value, variation: variation)
end
###Market###



###Analysis###
analysis_list = [
  [1, "IT0001233417", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [2, "IT0003506190", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [3, "IT0003261697", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [4, "IT0001031084", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [5, "IT0004776628", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [6, "IT0005218380", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [7, "IT0000066123", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [8, "IT0005252728", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [9, "IT0001347308", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [10, "IT0005252207", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [11, "NL0010545661", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [12, "IT0003128367", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [13, "IT0003132476", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],  
  [14, "NL0012059018", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [15, "NL0011585146", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [16, "IT0003132476", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [17, "IT0000072170", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [18, "IT0003132476", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [19, "IT0000072618", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [20, "IT0005211237", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [21, "IT0003856405", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [22, "IT0001479374", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [23, "IT0001063210", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],  
  [24, "IT0000062957", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [25, "IT0004965148", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [26, "IT0003796171", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [27, "IT0004176001", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [28, "IT0003828271", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [29, "IT0005252140", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [30, "IT0004712375", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [31, "IT0003153415", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [32, "NL0000226223", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [33, "IT0003497168", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil], 
  [34, "LU0156801721", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [35, "IT0003242622", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [36, "IT0003487029", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [37, "IT0005239360", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [38, "IT0004810054", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [39, "IT0004827447", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [40, "IT0003540470", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil]
]

analysis_list.each do |stock_id, isin, borsa_italiana_support, borsa_italiana_resistance, borsa_italiana_fta, xxivore_support, xxivore_resistance, xxivore_shorttrend, xxivore_ftaindex, xxivore_rsi, xxivore_rsidiv, repubblica_support, repubblica_resistance, investing_dotcomrating|
  Analysis.create(stock_id: stock_id, isin: isin, borsa_italiana_support: borsa_italiana_support, borsa_italiana_resistance: borsa_italiana_resistance, borsa_italiana_fta: borsa_italiana_fta, xxivore_support: xxivore_support, xxivore_resistance: xxivore_resistance, xxivore_shorttrend: xxivore_shorttrend, xxivore_ftaindex: xxivore_ftaindex, xxivore_rsi: xxivore_rsi, xxivore_rsidiv: xxivore_rsidiv, repubblica_support: repubblica_support, repubblica_resistance: repubblica_resistance, investing_dotcomrating: investing_dotcomrating)
end
###Analysis setup###



###Study###

###Study###

