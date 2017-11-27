var tradingRadar = (function () {

    var _pageData = {};
    var $inputElem = $('#pageData');

    var $mainContainer = $('#main-wrapper');


    return {

        setPageData: function () {
            if ($inputElem.length > 0) {
                _pageData.isin = $inputElem.data('isin');
                _pageData.user = $inputElem.data('user');
                _pageData.isAdmin = $inputElem.data('isadmin');
                _pageData.isLogged = $inputElem.data('islogged');
            }
        },


        getPageData: function () {
            return _pageData;
        },

        getHPFilters: function () {
            return HPFilters;
        },
        
        debounce: function(func, wait, immediate) {
            var timeout;
            return function() {
                var context = this,
                    args = arguments;
                var later = function() {
                    timeout = null;
                    if (!immediate) func.apply(context, args);
                };
                var callNow = immediate && !timeout;
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
                if (callNow) func.apply(context, args);
            };
        },

        manageWindowPosition: function () {

            var offset = 110;
            var $title = $mainContainer.find('.entry-title');

            var checkPosition = tradingRadar.debounce(function () {
                if (window.pageYOffset >= offset) {                  
                	$title.addClass('fixed');
                }
                else {
                	$title.removeClass('fixed');
                }
            }, 50);

            checkPosition();

            $(window).scroll(function () {
                checkPosition();
            });
        },


        getParameterByName: function (name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        },


        fixHREFs: function () {
            var milanoFinanzaUrl = 'https://www.milanofinanza.it';
            $linksToChange = $mainContainer.find('.milano-finanza .news a');
            $linksToDisable = $mainContainer.find('.milano-finanza table a');
            $linksToChange.each(function () {
                var actualHREF = $(this).attr('href');
                var newHREF = milanoFinanzaUrl + actualHREF;
                $(this).attr('href', newHREF);
            });

            $linksToDisable.click(function (e) {
                e.preventDefault();
                $(this).removeAttr('href');
            })

        },


        loadSources: function () {

            var sourcesPromise = new Promise(function (resolve, reject) {
                var isin = tradingRadar.getPageData().isin;
                var $destinations = $mainContainer.find('.ext-source .pr-section');
                var count = 0;

                $destinations.each(function (index, elem) {
                    var url = '/sources/source' + (index + 1) + '?isin=' + isin;
                    var currentSource = $(this).parents('.ext-source').attr('id');
                    var $currentImageAnchor = $('.anchors').find('img[data-refers="' + currentSource + '"]');
                    var $target = $(this);

                    $.ajax({
                        url: url,
                        data: 'text/html',
                        type: 'get',
                        success: function (data) {
                            var content = $(data).html();
                            $target.html(content);
                            $target.addClass('loaded');
                            $currentImageAnchor.addClass('ready');
                        },
                        error: function () {
                            console.error('Unable to perform request');
                            $target.addClass('error');
                            $currentImageAnchor.addClass('error');
                        },
                        complete: function () {                            
                            count++;
                            if (count == $destinations.length) {
                                resolve();
                            }
                        }
                    });


                });

            }).then(function () {
                tradingRadar.fixHREFs();
            }).catch(function (err) {
                console.error(err);
            });


        },
        
        
        initDatatable: function () {
        	var dataTable = null;

        	document.addEventListener("turbolinks:before-cache", function() {
        	  if (dataTable !== null) {
        	   dataTable.destroy();
        	   dataTable = null;
        	  }
        	})
        	
        	dataTable = $('#stock-table').DataTable( {
        		"ordering": false,
        		"paging":   false,
        		"searching": false,
        		"stateSave": true
        	} );
        },
        
        
        makePostDescrClickable: function () {
        	var $lastPost = $mainContainer.find('#last-post');
        	var lastPostUrl = $lastPost.find('.more a').attr('href');
        	var $postTitle = $lastPost.find('h2');
        	var $postSubTitle = $lastPost.find('h3');
        	$postTitle.click(function() {
        		window.location.href = lastPostUrl;
        	});
        	$postSubTitle.click(function() {
        		window.location.href = lastPostUrl;
        	});
        },        


        highlightStocks: function () {



			$('.break-outs .hp-filter').eq(0).find('table.Resistenza tbody tr').each(function () {
			    var isin = $(this).data('isin');
			    var $occurences = $('.break-outs table.Resistenza tbody tr[data-isin=' + isin + ']');
			
			    if ($occurences.length >= 2) {
			        $occurences.addClass('repeated green');
			    }
			});


			$('.break-outs .hp-filter').eq(0).find('table.Supporto tbody tr').each(function () {
			    var isin = $(this).data('isin');
			    var $occurences = $('.break-outs table.Supporto tbody tr[data-isin=' + isin + ']');
			
			    if ($occurences.length >= 2) {
			        $occurences.addClass('repeated red');
			    }
			});


            $('.suggestions table:first-child tr').each(function () {
                var isin = $(this).data('isin');
                var $occurences = $('.suggestions tr[data-isin=' + isin + ']');

                var count = $occurences.length
                if (count >= 3) {
                    $occurences.addClass('repeated');
                }
            });   

        },



        loadHPFilters: function () {

            var filters = tradingRadar.getHPFilters();
            var filtersToExecute = filters;//.filter(function(obj){return obj.active});
            var filtersCount = filters.length;
            var filtersWorked = 0;
            

            var filtersPromise = new Promise(function (resolve, reject) {
                for (var filter in filtersToExecute) {

                    if (filters.hasOwnProperty(filter)) {


                        var filterPromise = new Promise(function (resolve, reject) {
                            var obj = filters[filter];

                            var $filter = $mainContainer.find('.filters .hp-filter:eq(' + obj.index + ')');
                            //var $titleElem = $filter.find('h2');
                            var $contentElem = $filter.find('.filter-content');
                            //var $infoFilter = $filter.find('.filter-info');
                            var $iconFilter = $filter.find('.cat-links');
                            var count = 0;
                            
                            //$titleElem.html(obj.title);

                            var $ico = $('<img/>', obj.icon).appendTo($iconFilter);
                            
                            //$infoFilter.find('h3').html(obj.info_title);
                            //$infoFilter.find('p').html(obj.info_content);

                            if (!obj.active) {

                                var $placeholder = $('<div/>');
                                $placeholder.html('Filtro non diponibile. <br/> Utente non loggato o dati non disponibili.');

                                $placeholder.appendTo($contentElem);

                                $contentElem.addClass('disabled');

                                resolve();

                                return;
                            }


                            obj.urls.forEach(function (url, index) {

                                var $table = $('<table/>', {
                                    class: 'tablesorter ' + obj.captions[index]
                                }).appendTo($contentElem);

                                var $caption = $('<caption/>', {
                                    text: obj.captions[index]
                                });
                                $table.append($caption);

                                var thead = '';
                                thead = '<thead><tr>';
                                obj.table_headers[index].forEach(function (theader) {
                                    thead += '<th>' + theader + '</th>';
                                });
                                thead += '</tr></thead>';
                                $table.append(thead);

                                $.ajax({
                                    url: url,
                                    data: 'text/json',
                                    type: 'get',
                                    success: function (response) {
                                    	
                                    	var tbody = '';
                                    	
                                    	
                                    	if(response.length === 0) {
                                        	tbody += '<tbody><tr><td class="no-entry" colspan="' + obj.table_headers[0].length + '">Non ci sono titoli da mostrare in questa tabella</td></tr></tbody>';
                                        }
                                    	else {
                                    		
                                    		tbody += '<tbody>';
                                    		
                                    		$.each(response, function (i, item) {
                                                var rowClass = i % 2 === 0 ? 'even' : 'odd';                                                

                                                tbody += '<tr class="' + rowClass + '" data-isin="' + item.isin + '">';
                                                tbody += '<td><a title="Rassegna stampa del titolo: ' + item.name + '" href="' + '/analisi_tecnica_titolo/index?' + item.name + '&isin=' + item.isin + '">' + item.name + '</a></td>';                                              
                                                
                                                var price, variation, delta;
                                                
                                                obj.attributes[index].forEach(function (attribute, i) {
                                                	
                                                	var attrLength = obj.attributes[index].length-1;  
                                                	
                                                	var currentValue = item[attribute] ? item[attribute] : 'nd';
                                                	
                                                	if(attribute==='updated_at') {
                                                		currentValue = new Date(Date.parse(item[attribute])).toLocaleString();
                                                	}
                                                	
                                                	if(obj.attributes[index][attrLength] == 'delta') {                                                		                                              		
                                                		
                                                		if(i===0) {
                                                    		price = currentValue;
                                                    		tbody += '<td>' + price + '</td>';
                                                    	}
                                                    		
                                                    	if(i===1) {
                                                    		variation = currentValue;
                                                    		tbody += '<td>' + currentValue + '</td>';
                                                    	}
                                                    	
                                                    	if(i===attrLength) {
                                                    		delta = (Math.abs(price - variation)/(price/100)).toFixed(2);
                                                    		tbody += '<td>' + delta + '</td>';
                                                    		price = null;
                                                    		variation = null;
                                                    		delta = null;
                                                    	}
                                                    	
                                                    }
                                                	else {
                                                		tbody += '<td>' + currentValue + '</td>';
                                                	}
                                                	
           
                                                });
                                                tbody += '</tr>';
                                                

                                            });
                                    		tbody += '</tbody>';
                                    	};

                                        $table.append(tbody);

                                    },
                                    error: function (err) {
                                        console.error(err);
                                        reject();

                                    },
                                    complete: function () {
                                        count++;
                                        if (count === obj.urls.length) {
                                            $contentElem.addClass('loaded');
                                            resolve(); 
                                        }
                                    }
                                });

                            });

                        }).then(function () {
                        	filtersWorked++;
                        	if (filtersCount == filtersWorked) {  
                                resolve();                                                
                            }
                        }).catch(function (err) {
                            console.error(err);
                        });

                    }
                }
            }).then(function () {
                tradingRadar.highlightStocks();
            }).catch(function (err) {
                console.error(err);
            });

        }

    }

}());




tradingRadar.setPageData();
var pageData = tradingRadar.getPageData();



$(document).ready(function () {
	
    $('#main-wrapper').find(".tablesorter:not(.nojs)").tablesorter();


    if ($('.analisi_tecnica_titolo').length) {
        tradingRadar.loadSources();
        tradingRadar.manageWindowPosition();
    }


    if ($('.welcome').length) {
        tradingRadar.loadHPFilters();
        tradingRadar.initDatatable();
        tradingRadar.makePostDescrClickable();
    }
    
    
    document.addEventListener("turbolinks:before-cache", function() {
    	var $filtersWrapper = $('#main-wrapper .filters');
    	$filtersWrapper.find('.hp-filter .filter-content').html('').removeClass('loaded').removeClass('disabled');
    	$filtersWrapper.find('.hp-filter .cat-links img').remove();
  	})

});



var HPFilters = [
    {
        index: 0,
        active: true,
        title: 'Violazione trendline',
        urls: ['/filters/filter_overResistanceBorsaItaliana', '/filters/filter_belowSupportBorsaItaliana'],
        icon: {
            class: 'img-logo-small',
            src: '/images/borsa-italiana-logo-small.png',
            title: 'Superamento dei supporti o resistenze da Borsa Italiana',
            alt: 'Superamento dei supporti o resistenze da Borsa Italiana'
        },
        captions: ['Resistenza', 'Supporto'],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'Resistenza Borsa Italiana', 'Differenza in %'],
            ['Nome', 'Ultimo prezzo', 'Supporto Borsa Italiana', 'Differenza in %']
        ],
        attributes: [
            ['last_price', 'borsa_italiana_resistance', 'delta'],
            ['last_price', 'borsa_italiana_support', 'delta']
        ],
        info_title: 'Violazione trendline "Borsa Italiana"',
        info_content: 'Violazione di resistenze e supporti secondo l\'analisi di "Borsa Italiana". <br/><br/><i>In evidenza i titoli che violano la trendline anche per altri media presi in esame.</i><br/><br/>Il <strong>supporto</strong> è un livello che si pone come ostacolo ad una ulteriore discesa del prezzo. Può essere il punto di svolta che precede un rimbalzo tecnico, ma se superato può implicare un deciso proseguimento nella direzione della rottura. <br/>La <strong>resistenza</strong> è un livello che si pone come ostacolo ad una salita del prezzo. Può essere il punto di svolta che precede un ritracciamento tecnico, ma, se superato, tale livello può implicare un deciso proseguimento nella direzione della rottura.'
    },
    {
        index: 1,
        active: true,
        title: 'Violazione trendline',
        urls: ['/filters/filter_overResistanceSoleXXIVOre', '/filters/filter_belowSupportSoleXXIVOre'],
        icon: {
            class: 'img-logo-small',
            src: '/images/il-sole-24-ore-logo-small.png',
            title: 'Supporti e resistenze da Il Sole 24 Ore',
            alt: 'Supporti e resistenze da Il Sole 24 Ore'
        },
        captions: ['Resistenza', 'Supporto'],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'Resistenza Il Sole 24 ore', 'Differenza in %'],
            ['Nome', 'Ultimo prezzo', 'Supporto Il Sole 24 Ore', 'Differenza in %']
        ],
        attributes: [
            ['last_price', 'xxivore_resistance', 'delta'],
            ['last_price', 'xxivore_support', 'delta']
        ],
        info_title: 'Violazione trendline per "Il Sole 24 Ore"',
        info_content: 'Violazione di resistenze e supporti secondo l\'analisi de "Il Sole 24 Ore". <br/><br/><i>In evidenza i titoli che violano la trendline anche per altri media presi in esame.</i><br/><br/>Il <strong>supporto</strong> è un livello che si pone come ostacolo ad una ulteriore discesa del prezzo. Può essere il punto di svolta che precede un rimbalzo tecnico, ma se superato può implicare un deciso proseguimento nella direzione della rottura. <br/>La <strong>resistenza</strong> è un livello che si pone come ostacolo ad una salita del prezzo. Può essere il punto di svolta che precede un ritracciamento tecnico, ma, se superato, tale livello può implicare un deciso proseguimento nella direzione della rottura.'
    },
    /*{
        index: 2,
        active: false,
        title: 'Violazione trendline',
        urls: ['/filters/filter_overResistanceRepubblica', '/filters/filter_belowSupportRepubblica'],
        icon: {
            class: 'img-logo-small',
            src: '/images/la-repubblica-logo-small.png',
            title: 'Supporti e resistenze da La Repubblica',
            alt: 'Supporti e resistenze da La Repubblica'
        },
        captions: ['Resistenza', 'Supporto'],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'Resistenza La Repubblica'],
            ['Nome', 'Ultimo prezzo', 'Supporto La Repubblica']
        ],
        attributes: [
            ['last_price', 'repubblica_resistance'],
            ['last_price', 'repubblica_support']
        ],
        info_title: 'Violazione trendline per "La Repubblica"',
        info_content: 'Violazione di resistenze e supporti secondo "La Repubblica" <br/><br/>"La Repubblica Finanza e Mercati" non rilascia più dati su analisi e resistenze.'
    },*/

    {
        index: 2,
        active: true,
        title: 'Indicazioni dai media',
        urls: ['/filters/filter_suggestionsMilanoFinanza'],
        icon: {
            class: 'img-logo-small',
            src: '/images/milano-finanza-logo-small.png',
            title: 'Indicazioni da Milano Finanza',
            alt: 'Indicazioni da Milano Finanza'
        },
        captions: [],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'MF Risk', 'MF Rating']
        ],
        attributes: [
            ['last_price', 'milano_finanza_risk', 'milano_finanza_rating']
        ],
        info_title: 'Indicazioni da "Milano Finanza"',
        info_content: 'Titoli con "MF Risk" minore di 25 e "MF Rating" con valore almeno B secondo le analisi di "Milano Finanza" <br/><br/> L\'indice <strong>MF Risk</strong> di Milano Finanza misura la perdita percentuale massima cui l\'attività può verosimilmente condurre nell\'arco temporale di un mese.<br/><br/><strong>MF Rating</strong> è il rating di appetibilità pubblicato da Milano Finanza. Sintetizza la situazione tecnico-quantitativa (rischio-rendimento) e il confronto internazionale dei multipli di borsa. (A+ = rating più elevato, E- = rating più basso).'
    },

    {
        index: 3,
        active: true,
        title: 'Indicazioni dai media',
        urls: ['/filters/filter_suggestionsSoleXXIVOre'],
        icon: {
            class: 'img-logo-small',
            src: '/images/il-sole-24-ore-logo-small.png',
            title: 'Indicazioni da Il Sole 24 Ore',
            alt: 'Indicazioni da Il Sole 24 Ore'
        },
        captions: [],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'Short Trend', 'FTA Index', 'RSI']
        ],
        attributes: [
            ['last_price', 'xxivore_shorttrend', 'xxivore_ftaindex', 'xxivore_rsi']
        ],
        info_title: 'Indicazioni da "Il Sole 24 Ore"',
        info_content: 'Titoli con "Short trend" "Molto rialzista" e "FTA Index" di almeno 50 e "RSI" almeno 75 secondo le analisi de "Il Sole 24 Ore"<br/><br/>Lo <strong>short trend</strong> descrive lo stato della tendenza relativa al titolo nelle ultime settimane.<br/><br/>L\'<strong>Fta Index</strong> è un indicatore creato da Financial Trend Analysis, il cui valore oscilla tra +100 e -100. Valori superiori a 30 sono indice di un quadro tecnico favorevolmente orientato, viceversa per valori inferiori a -30.<br/><br/>l\'<strong>RSI</strong> è il valore dell\'indice di forza relativa (0-100) calcolato ad 8 giorni. Il range 35-65 è definito neutrale: al di sopra di 65 si parla di una condizione di Ipercomprato, al di sotto di 30 di una condizione di Ipervenduto.'
    },

    {
        index: 4,
        active: true,
        title: 'Indicazioni dai media',
        urls: ['/filters/filter_suggestionsInvestingDotCom'],
        icon: {
            class: 'img-logo-small',
            src: '/images/investing-logo-small.png',
            title: 'Indicazioni da Investing.com',
            alt: 'Indicazioni da Investing.com'
        },
        captions: [],
        table_headers: [
            ['Nome', 'Ultimo prezzo']
        ],
        attributes: [
            ['last_price']
        ],
        info_title: 'Indicazioni da Investing.com',
        info_content: 'Titoli con valutazione "Compra ora" nel frame temporale giornaliero e mensile secondo le analisi di "Investing.com"'
    },




    {
        index: 5,
        active: pageData.isLogged,
        title: 'Violazione trendline',
        urls: ['/filters/filter_overResistanceStocksOnStudy', '/filters/filter_belowSupportStocksOnStudy'],
        captions: ['Resistenza', 'Supporto'],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'Resistenza', 'Data creazione'],
            ['Nome', 'Ultimo prezzo', 'Supporto', 'Data creazione']
        ],
        attributes: [
            ['last_price', 'resistance', 'updated_at'],
            ['last_price', 'support', 'updated_at']
        ],
        info_title: 'Violazione trendline',
        info_content: 'Violazione di resistenze e supporti secondo le tue Analisi personali'
    }

/*
    {
        index: 7,
        active: pageData.isLogged,
        title: 'Rafforzamento del trend in atto',
        urls: ['/filters/filter_trendReinforcement'],
        captions: [],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'Posizione', 'Pattern', 'Candlestick']
        ],
        attributes: [
            ['last_price', 'trading_position', 'continuation_chart_pattern', 'continuation_candlestick']
        ],
        info_title: 'Rafforzamento del trend in atto',
        info_content: 'Rafforzamento del trend in atto secondo le tue Analisi personali'
    },

    {
        index: 8,
        active: pageData.isLogged,
        title: 'Cambiamento del trend in atto',
        urls: ['/filters/filter_trendChanging'],
        captions: [],
        table_headers: [
            ['Nome', 'Ultimo prezzo', 'Posizione', 'Pattern', 'Candlestick', 'Div. RSI', 'Div, Stocastico']
        ],
        attributes: [
            ['last_price', 'trading_position', 'reversal_chart_pattern', 'reversal_candlestick', 'rsi_divergence', 'stoch_divergence']
        ],
        info_title: 'Rafforzamento del trend in atto',
        info_content: 'Rafforzamento del trend in atto secondo le tue Analisi personali'
    }*/


]