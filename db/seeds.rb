# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Study.delete_all
Analysis.delete_all
Stock.delete_all

Url.delete_all
Market.delete_all



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
  [16, "NL0010877643", "", "Fiat Chrysler Automobiles", "", nil, "", ""],
  [17, "IT0000072170", "", "Finecobank", "", nil, "", ""],
  [18, "IT0000062072", "", "Generali", "", nil, "", ""],
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
  [ "IT0001233417", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001233417&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!A2A.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001233417&Lettera=A&QUOTE=%21A2A.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=A2A:IM", "https://it.investing.com/equities/a2a-spa", "", "https://www.milanofinanza.it/quotazioni/dettaglio/a2a-2ae00c0", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00c0&codicestrumento=w2ae&DBCOD=A2A"],
  [ "IT0003506190", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003506190.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003506190&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!ATL.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003506190&Lettera=A&QUOTE=%21ATL.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=ATL:IM", "https://it.investing.com/equities/atlantia", "", "https://www.milanofinanza.it/quotazioni/dettaglio/atlantia-2ae003b", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=003b&codicestrumento=w2ae&DBCOD=ATL"],
  [ "IT0003261697", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003261697.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003261697&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!AZM.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003261697&Lettera=A&QUOTE=%21AZM.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=AZM:IM", "https://it.investing.com/equities/azimut-holding", "", "https://www.milanofinanza.it/quotazioni/dettaglio/azimut-2ae03ba", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=03ba&codicestrumento=w2ae&DBCOD=AZM"],
  [ "IT0001031084", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001031084.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001031084&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BGN.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001031084&Lettera=B&QUOTE=%21BGN.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=BGN:IM", "https://it.investing.com/equities/banca-generali", "", "https://www.milanofinanza.it/quotazioni/dettaglio/banca-generali-2ae0405", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0405&codicestrumento=w2ae&DBCOD=BGN"],
  [ "IT0004776628", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004776628.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004776628&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BMED.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0004776628&Lettera=B&QUOTE=%21BMED.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=BMED:IM", "https://it.investing.com/equities/mediolanum", "", "https://www.milanofinanza.it/quotazioni/dettaglio/banca-mediolanum-2ae106c", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=106c&codicestrumento=w2ae&DBCOD=BMED"],
  [ "IT0005218380", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005218380.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005218380&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BAMI.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0005218380&Lettera=B&QUOTE=%21BAMI.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=BAMI:IM", "https://it.investing.com/equities/banco-popolare", "", "https://www.milanofinanza.it/quotazioni/dettaglio/banco-bpm-2ae10a2", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=10a2&codicestrumento=w2ae&DBCOD=BAMI"],
  [ "IT0000066123", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000066123.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000066123&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BPE.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0000066123&Lettera=B&QUOTE=%21BPE.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=BPE:IM", "https://it.investing.com/equities/banca-popolare-dell-emilia", "", "https://www.milanofinanza.it/quotazioni/dettaglio/bper-banca-2ae006e", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=006e&codicestrumento=w2ae&DBCOD=BPE"],
  [ "IT0005252728", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005252728.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005252728&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BRE.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0005252728&Lettera=B&QUOTE=%21BRE.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=BRE:IM", "https://it.investing.com/equities/brembo", "", "https://www.milanofinanza.it/quotazioni/dettaglio/brembo-2ae000c", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=000c&codicestrumento=w2ae&DBCOD=BRE"],
  [ "IT0001347308", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001347308.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001347308&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!BZU.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001347308&Lettera=B&QUOTE=%21BZU.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=BZU:IM", "https://it.investing.com/equities/buzzi-unicem", "", "https://www.milanofinanza.it/quotazioni/dettaglio/buzzi-unicem-2ae0013", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0013&codicestrumento=w2ae&DBCOD=BZU"],
  [ "IT0005252207", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005252207.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005252207&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!CPR.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0005252207&Lettera=C&QUOTE=%21CPR.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=CPR:IM", "https://it.investing.com/equities/campari", "", "https://www.milanofinanza.it/quotazioni/dettaglio/campari-2ae01f2", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=01f2&codicestrumento=w2ae&DBCOD=CPR"],
  [ "NL0010545661", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0010545661.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0010545661&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!CNHI.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=NL0010545661&Lettera=C&QUOTE=%21CNHI.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=CNHI:IM", "https://it.investing.com/equities/cnh-industral-nv?cid=42603", "", "https://www.milanofinanza.it/quotazioni/dettaglio/cnh-industrial-2ae1025", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=1025&codicestrumento=w2ae&DBCOD=CNHI"],
  [ "IT0003128367", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003128367.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003128367&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!ENEL.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003128367&Lettera=E&QUOTE=%21ENEL.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=ENEL:IM", "https://it.investing.com/equities/enel", "", "https://www.milanofinanza.it/quotazioni/dettaglio/enel-2ae008b", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=008b&codicestrumento=w2ae&DBCOD=ENEL"],
  [ "IT0003132476", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003132476.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003132476&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!ENI.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003132476&Lettera=E&QUOTE=%21ENI.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=ENI:IM", "https://it.investing.com/equities/eni", "", "https://www.milanofinanza.it/quotazioni/dettaglio/eni-2ae0017", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0017&codicestrumento=w2ae&DBCOD=ENI"],
  [ "NL0012059018", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0012059018.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0012059018&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!EXO.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=NL0012059018&Lettera=E&QUOTE=%21EXO.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=EXO:IM", "https://it.investing.com/equities/exor", "", "https://www.milanofinanza.it/quotazioni/dettaglio/exor-2ae010d", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=010d&codicestrumento=w2ae&DBCOD=EXO"],
  [ "NL0011585146", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0011585146.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0011585146&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!RACE.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=NL0011585146&Lettera=F&QUOTE=%21RACE.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=RACE:IM", "https://it.investing.com/equities/ferrari-nv?cid=962346", "", "https://www.milanofinanza.it/quotazioni/dettaglio/ferrari-2ae106d", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=106d&codicestrumento=w2ae&DBCOD=RACE"],
  [ "NL0010877643", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0010877643.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0010877643&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!FCA.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=NL0010877643&Lettera=F&QUOTE=%21FCA.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=FCA:IM", "https://it.investing.com/equities/fiat", "", "https://www.milanofinanza.it/quotazioni/dettaglio/fiat-chrysler-automobiles-2ae00be", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00be&codicestrumento=w2ae&DBCOD=FCA"],
  [ "IT0000072170", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000072170.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000072170&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!FBK.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0000072170&Lettera=F&QUOTE=%21FBK.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=FBK:IM", "https://it.investing.com/equities/finecobank-banca-fineco-spa", "", "https://www.milanofinanza.it/quotazioni/dettaglio/finecobank-2ae103d", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=103d&codicestrumento=w2ae&DBCOD=FBK"],
  [ "IT0000062072", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000062072.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000062072&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!G.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0000062072&Lettera=G&QUOTE=%21G.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=G:IM", "https://it.investing.com/equities/generali-ass", "", "https://www.milanofinanza.it/quotazioni/dettaglio/generali-ass-2ae00e5", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00e5&codicestrumento=w2ae&DBCOD=G"],
  [ "IT0000072618", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000072618.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000072618&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!ISP.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0000072618&Lettera=I&QUOTE=%21ISP.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=ISP:IM", "https://it.investing.com/equities/intesa-sanpaolo", "", "https://www.milanofinanza.it/quotazioni/dettaglio/intesa-sanpaolo-2ae0056", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0056&codicestrumento=w2ae&DBCOD=ISP"],
  [ "IT0005211237", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005211237.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005211237&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!IG.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0005211237&Lettera=I&QUOTE=%21IG.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=IG:IM", "https://it.investing.com/equities/italgas-spa", "", "https://www.milanofinanza.it/quotazioni/dettaglio/italgas-2ae109f", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=109f&codicestrumento=w2ae&DBCOD=IG"],
  [ "IT0003856405", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003856405.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003856405&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!LDO.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003856405&Lettera=L&QUOTE=%21LDO.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=LDO:IM", "https://it.investing.com/equities/finmeccanica", "", "https://www.milanofinanza.it/quotazioni/dettaglio/leonardo-2ae00b2", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00b2&codicestrumento=w2ae&DBCOD=LDO"],
  [ "IT0001479374", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001479374.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001479374&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!LUX.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001479374&Lettera=L&QUOTE=%21LUX.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=LUX:IM", "https://it.investing.com/equities/luxottica", "", "https://www.milanofinanza.it/quotazioni/dettaglio/luxottica-group-2ae01c1", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=01c1&codicestrumento=w2ae&DBCOD=LUX"],
  [ "IT0001063210", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0001063210.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001063210&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!MS.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001063210&Lettera=M&QUOTE=%21MS.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=MS:IM", "https://it.investing.com/equities/mediaset", "", "https://www.milanofinanza.it/quotazioni/dettaglio/mediaset-s-p-a-2ae0029", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0029&codicestrumento=w2ae&DBCOD=MS"],
  [ "IT0000062957", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0000062957.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0000062957&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!MB.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0000062957&Lettera=M&QUOTE=%21MB.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=MB:IM", "https://it.investing.com/equities/mediobanca", "", "https://www.milanofinanza.it/quotazioni/dettaglio/mediobanca-2ae011d", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=011d&codicestrumento=w2ae&DBCOD=MB"],
  [ "IT0004965148", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004965148.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004965148&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!MONC.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0004965148&Lettera=M&QUOTE=%21MONC.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=MONC:IM", "https://it.investing.com/equities/moncler-spa", "", "https://www.milanofinanza.it/quotazioni/dettaglio/moncler-2ae1029", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=1029&codicestrumento=w2ae&DBCOD=MONC"],
  [ "IT0003796171", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003796171.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003796171&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!PST.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003796171&Lettera=P&QUOTE=%21PST.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=PST:IM", "https://it.investing.com/equities/poste-italiane-spa", "", "https://www.milanofinanza.it/quotazioni/dettaglio/poste-italiane-2ae1064", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=1064&codicestrumento=w2ae&DBCOD=PST"],
  [ "IT0004176001", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004176001.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004176001&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!PRY.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0004176001&Lettera=P&QUOTE=%21PRY.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=PRY:IM", "https://it.investing.com/equities/prysmian", "", "https://www.milanofinanza.it/quotazioni/dettaglio/prysmian-2ae041e", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=041e&codicestrumento=w2ae&DBCOD=PRY"],
  [ "IT0003828271", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003828271.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003828271&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!REC.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003828271&Lettera=P&QUOTE=%21REC.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=REC:IM", "https://it.investing.com/equities/recordati", "", "https://www.milanofinanza.it/quotazioni/dettaglio/recordati-ord-2ae01cd", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=01cd&codicestrumento=w2ae&DBCOD=REC"],
  [ "IT0005252140", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005252140.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005252140&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!SPM.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0005252140&Lettera=S&QUOTE=%21SPM.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=SPM:IM", "https://it.investing.com/equities/saipem", "", "https://www.milanofinanza.it/quotazioni/dettaglio/saipem-2ae0193", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0193&codicestrumento=w2ae&DBCOD=SPM"],
  [ "IT0004712375", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004712375.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004712375&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!SFER.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0004712375&Lettera=S&QUOTE=%21SFER.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=SFER:IM", "https://it.investing.com/equities/salvatore-ferragamo-italia-spa", "", "https://www.milanofinanza.it/quotazioni/dettaglio/salvatore-ferragamo-2ae0049", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0049&codicestrumento=w2ae&DBCOD=SFER"],
  [ "IT0003153415", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003153415.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003153415&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!SRG.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003153415&Lettera=S&QUOTE=%21SRG.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=SRG:IM", "https://it.investing.com/equities/snam-rete-gas", "", "https://www.milanofinanza.it/quotazioni/dettaglio/snam-2ae0363", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0363&codicestrumento=w2ae&DBCOD=SRG"],
  [ "NL0000226223", "http://www.borsaitaliana.it/borsa/azioni/scheda/NL0000226223.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=NL0000226223&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!STM.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=NL0000226223&Lettera=S&QUOTE=%21STM.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=STM:IM", "https://it.investing.com/equities/stmicroelectroni?cid=22185", "", "https://www.milanofinanza.it/quotazioni/dettaglio/stmicroelectronics-2ae0022", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0022&codicestrumento=w2ae&DBCOD=STM"],
  [ "IT0003497168", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003497168.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003497168&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!TIT.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003497168&Lettera=T&QUOTE=%21TIT.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=TIT:IM", "https://it.investing.com/equities/telecom-italia", "", "https://www.milanofinanza.it/quotazioni/dettaglio/telecom-italia-2ae0098", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0098&codicestrumento=w2ae&DBCOD=TIT"], 
  [ "LU0156801721", "http://www.borsaitaliana.it/borsa/azioni/scheda/LU0156801721.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=LU0156801721&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!TEN.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=LU0156801721&Lettera=T&QUOTE=%21TEN.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=TEN:IM", "https://it.investing.com/equities/tenaris", "", "https://www.milanofinanza.it/quotazioni/dettaglio/tenaris-2ae0383", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0383&codicestrumento=w2ae&DBCOD=TEN"],
  [ "IT0003242622", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003242622.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003242622&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!TRN.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003242622&Lettera=T&QUOTE=%21TRN.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=TRN:IM", "https://it.investing.com/equities/terna", "", "https://www.milanofinanza.it/quotazioni/dettaglio/terna-2ae03b7", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=03b7&codicestrumento=w2ae&DBCOD=TRN"],
  [ "IT0003487029", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003487029.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003487029&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!UBI.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003487029&Lettera=U&QUOTE=%21UBI.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=UBI:IM", "https://it.investing.com/equities/ubi-banca", "", "https://www.milanofinanza.it/quotazioni/dettaglio/ubi-banca-2ae039f", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=039f&codicestrumento=w2ae&DBCOD=UBI"],
  [ "IT0005239360", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0005239360.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0005239360&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!UCG.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0005239360&Lettera=U&QUOTE=%21UCG.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=UCG:IM", "https://it.investing.com/equities/unicredito", "", "https://www.milanofinanza.it/quotazioni/dettaglio/unicredit-2ae0096", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0096&codicestrumento=w2ae&DBCOD=UCG"],
  [ "IT0004810054", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004810054.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004810054&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!UNI.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0004810054&Lettera=U&QUOTE=%21UNI.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=UNI:IM", "https://it.investing.com/equities/unipol", "", "https://www.milanofinanza.it/quotazioni/dettaglio/unipol-2ae002b", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=002b&codicestrumento=w2ae&DBCOD=UNI"],
  [ "IT0004827447", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0004827447.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0004827447&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!US.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0004827447&Lettera=U&QUOTE=%21US.MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=US:IM", "https://it.investing.com/equities/fondiaria-sai", "", "https://www.milanofinanza.it/quotazioni/dettaglio/unipolsai-2ae0126", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=0126&codicestrumento=w2ae&DBCOD=US"],
  [ "IT0003540470", "http://www.borsaitaliana.it/borsa/azioni/scheda/IT0003540470.html?lang=it", "http://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0003540470&lang=it", "http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!YNAP.MI", "http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0003540470&Lettera=Y&QUOTE=%21YNAP .MI", "", "http://finanza.repubblica.it/Company/Advanced?symbol=YNAP:IM", "https://it.investing.com/equities/yoox-spa", "", "https://www.milanofinanza.it/quotazioni/dettaglio/yoox-net-a-porter-group-2ae06a0", "https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=06a0&codicestrumento=w2ae&DBCOD=YNAP"]
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
  [16, "NL0010877643", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [17, "IT0000072170", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
  [18, "IT0000062072", nil, nil, "", nil, nil, "", "", "", "", nil, nil, nil],
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
