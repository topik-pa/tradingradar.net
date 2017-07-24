# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



###Stock###
#Stock.delete_all

#stock_list = [
#  [ "IT0001233417", "A2A", "A2a", "Servizi Pubblici", "1.416", "+0.43%", "Negoziazione"],
#  [ "IT0005218380", "BAMI", "Banco Bpm", "Banche e Finanza", "2.73", "+2.41%", "Negoziazione"],
#  [ "IT0003856405", "LDO", "Leonardo", "Metalmeccanica", "12.76", "-0.15%", "Negoziazione"],
#  [ "IT0001479374", "LUX", "Luxottica Group", "Moda e abbigliamento", "51.25", "-2.29%", "Negoziazione"],
#  [ "IT0001063210", "MS", "Mediaset S.P.A", "Media", "3.852", "+0.42%", "Negoziazione"]
#]

#stock_list.each do |isin, cod, name, sector, lastPrice, variation, marketPhase|
#  Stock.create(isin: isin, cod: cod, name: name, sector: sector, lastPrice: lastPrice, variation: variation, marketPhase: marketPhase)
#end
###Stock###

###Stock setup###

###Stock setup###


###Url###
#Url.delete_all

#url_list = [
#  [ "IT0001233417", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001233417&lang=it", "", "http://finanza-mercati.ilsole24ore.com/azioni/pagine/dettaglio_fta_sommario/dettaglio_fta_sommario.php?FILTER_VALUE=IT0001233417&Lettera=A&QUOTE=!A2A.MI&refresh_ce", "", "http://finanza.repubblica.it/Company/Advanced?symbol=A2A:IM&refresh_ce", "https://it.investing.com/equities/a2a-spa", "", "", ""],
#]

#url_list.each do |isin, url1, url2, url3, url4, url5, url6, url7, url8, url9, url10|
#  Url.create(isin: isin, url1: url1, url2: url2, url3: url3, url4: url4, url5: url5, url6: url6, url7: url7, url8: url8, url9: url9, url10: url10)
#end
###Url###

###Url setup###

###Url setup###


###Market###
#Market.delete_all

#market_list = [ 
#  [ "FTSE MIB", "20276.8", "-0.26%"],
#  [ "FTSE All Share", "22336.89", "-0.34%"],
#  [ "S&P 100", "1045.14", "-0.02%"],
#  [ "NIKKEI 225", "19217.48", "+0.08%"],
#  [ "DAX 30", "12203", "+0.44%"],
#  [ "CAC 40", "5069.04", "+0.45%"],
#  [ "NASDAQ 100", "5419.0187", "+0.22%"],
#  [ "GOLD", "37.43", "+0.43%"],
#  [ "Brent", "52.23", "+1.75%"],
#  [ "WTI", "49.34", "+2.01%"],
#  [ "EUR/USD", "1.075285", "-0.56%"],
#  [ "EUR/GBP", "0.866285", "-0.20%"]
#]

#market_list.each do |name, value, variation|
#  Market.create(name: name, value: value, variation: variation)
#end
###Market###

###Market setup###

###Market setup###


###Study###
Study.delete_all

studies_list = [
  [ "", "", "", "", "", "None", "Neutral", "", "", "", "", "Neutral", "None", "Neutral", "Neutral", "None", "Neutral", "Neutral", "None", "1.420", "1.56", "1.39", "http://www.mytradingbuddy.com/blog/wp-content/uploads/2016/07/basics-trading-orderflow.jpg", "Nota di prova", "1", "1"]
]

studies_list.each do |resistance, support, direction, mmp1, mmp2, gap, tradingPosition, reversalChartPattern, continuationChartPattern, reversalCandlestick, continuationCandlestick, rsi, rsiCross, rsiDivergence, stoch, stochCross, stochDivergence, macd, macdCross, buy, sell, stopLoss, imageUrl, note, stock_id, user_id|
  Study.create(resistance: resistance, support: support, direction: direction, mmp1: mmp1, mmp2: mmp2, gap: gap, tradingPosition: tradingPosition, reversalChartPattern: reversalChartPattern, continuationChartPattern: continuationChartPattern, reversalCandlestick: reversalCandlestick, continuationCandlestick: continuationCandlestick, rsi: rsi, rsiCross: rsiCross, rsiDivergence: rsiDivergence, stoch: stoch, stochCross: stochCross, stochDivergence: stochDivergence, macd: macd, macdCross: macdCross, buy: buy, sell: sell, stopLoss: stopLoss, imageUrl: imageUrl, note: note, stock_id: stock_id, user_id: user_id)
end
###Study###


###Analysis###
#Analysis.delete_all

#analises_list = [
#  [ "IT0001233417", "1.35", "1.42", "86", "1.405", "1.425", "Molto rialzista", "77", "80", "Div. Bear", "1.38", "1.50", "true"],
#  [ "IT0005218380", "2.45", "2.7", "56", "2.65", "2.76", "Rialzista", "85", "67", "Ipercomprato", "2.60", "2.90", "true"],
#  [ "IT0003856405", "12.0", "13.0", "21", "12.70", "12.85", "neutrale", "-20", "12", "Di. Bull", "12.0", "13.4", "false"],
#  [ "IT0001479374", "50.0", "52.3", "", "", "", "", "", "", "", "", "", "false"],
#  [ "IT0001063210", "", "", "", "", "", "", "", "", "", "", "", ""]
#]

#analises_list.each do |isin, borsaItalianaSupport, borsaItalianaResistance, borsaItalianaFTA, xxivOreSupport, xxivOreResistance, xxivOreShortTrend, xxivOreFTAIndex, xxivOreRSI, xxivOreRSIDiv, repubblicaSupport, repubblicaResistance, investingDotComRating|
#  Analysis.create(isin: isin, borsaItalianaSupport: borsaItalianaSupport, borsaItalianaResistance: borsaItalianaResistance, borsaItalianaFTA: borsaItalianaFTA, xxivOreSupport: xxivOreSupport, xxivOreResistance: xxivOreResistance, xxivOreShortTrend: xxivOreShortTrend, xxivOreFTAIndex: xxivOreFTAIndex, xxivOreRSI: xxivOreRSI, xxivOreRSIDiv: xxivOreRSIDiv, repubblicaSupport: repubblicaSupport, repubblicaResistance: repubblicaResistance, investingDotComRating: investingDotComRating)
#end
###Analysis###

###Analysis setup###

###Analysis setup###