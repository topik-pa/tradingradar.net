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
  [ "IT0003506190", "Atlantia"],
  [ "IT0003261697", "Azimut Holding"],
  [ "IT0001031084", "Banca Generali"],
  [ "IT0004776628", "Banca Mediolanum"],
  [ "IT0005218380", "Banco Bpm"],
  [ "IT0000066123", "Bper Banca"],
  [ "IT0005252728", "Brembo"],
  [ "IT0001347308", "Buzzi Unicem"],
  [ "IT0005252207", "Campari"],
  [ "NL0010545661", "Cnh Industrial"],
  [ "IT0003128367", "Enel"],
  [ "IT0003132476", "Eni"],  
  [ "NL0012059018", "Exor"],
  [ "NL0011585146", "Ferrari"],
  [ "IT0003132476", "Fiat Chrysler Automobiles"],
  [ "IT0000072170", "Finecobank"],
  [ "IT0003132476", "Generali"],
  [ "IT0000072618", "Intesa Sanpaolo"],
  [ "IT0005211237", "Italgas"],
  [ "IT0003856405", "Leonardo"],
  [ "IT0001479374", "Luxottica"],
  [ "IT0001063210", "Mediaset"],  
  [ "IT0000062957", "Mediobanca"],
  [ "IT0004965148", "Moncler"],
  [ "IT0003796171", "Poste Italiane"],
  [ "IT0004176001", "Prysmian"],
  [ "IT0003828271", "Recordati"],
  [ "IT0005252140", "Saipem"],
  [ "IT0004712375", "Salvatore Ferragamo"],
  [ "IT0003153415", "Snam"],
  [ "NL0000226223", "Stmicroelectronics"],
  [ "IT0003497168", "Telecom Italia"], 
  [ "LU0156801721", "Tenaris"],
  [ "IT0003242622", "Terna - Rete Elettrica Nazionale"],
  [ "IT0003487029", "Ubi Banca"],
  [ "IT0005239360", "Unicredit"],
  [ "IT0004810054", "Unipol"],
  [ "IT0004827447", "Unipolsai"],
  [ "IT0003540470", "Yoox Net-A-Porter Group"]
]

stock_list.each do |isin, name|
  Stock.create(isin: isin, name: name)
end
###Stock###


###Url###
Url.delete_all

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
Market.delete_all

market_list = [ 
  [ "FTSE MIB", "", ""],
  [ "FTSE All Share", "", ""],
  [ "S&P 100", "", ""],
  [ "NIKKEI 225", "", ""],
  [ "DAX 30", "", ""],
  [ "CAC 40", "", ""],
  [ "NASDAQ 100", "", ""],
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

###Study###
Study.delete_all
###Study###


###Analysis###
Analysis.delete_all

analysis_list = [
  "IT0001233417",
  "IT0003506190",
  "IT0003261697",
  "IT0001031084",
  "IT0004776628",
  "IT0005218380",
  "IT0000066123",
  "IT0005252728",
  "IT0001347308",
  "IT0005252207",
  "NL0010545661",
  "IT0003128367",
  "IT0003132476",  
  "NL0012059018",
  "NL0011585146",
  "IT0003132476",
  "IT0000072170",
  "IT0003132476",
  "IT0000072618",
  "IT0005211237",
  "IT0003856405",
  "IT0001479374",
  "IT0001063210",  
  "IT0000062957",
  "IT0004965148",
  "IT0003796171",
  "IT0004176001",
  "IT0003828271",
  "IT0005252140",
  "IT0004712375",
  "IT0003153415",
  "NL0000226223",
  "IT0003497168", 
  "LU0156801721",
  "IT0003242622",
  "IT0003487029",
  "IT0005239360",
  "IT0004810054",
  "IT0004827447",
  "IT0003540470"
]

analysis_list.each do |isin|
  Analysis.create(isin: isin)
end
###Analysis setup###