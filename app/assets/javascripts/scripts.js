var tradingRadar = (function() {

	var _pageData = {};	
	var $inputElem = $('#pageData');

	var $mainContainer = $('#main-wrapper');
	
	
	var HPFilters = {
			filter_1: {			        	   
				index: 0,
				active: true,
				title: 'Violazione trendline ',
				urls: ['/filters/filter_overResistanceBorsaItaliana', '/filters/filter_belowSupportBorsaItaliana'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/borsa-italiana-logo-small.png',
				    title: 'Supporti e resistenze da Borsa Italiana',
				    alt: 'Supporti e resistenze da Borsa Italiana'
				},						
				captions: ['Resistenza', 'Supporto'],
				table_headers: [ ['Nome', 'Ultimo prezzo', 'Borsa Italiana'], ['Nome', 'Ultimo prezzo', 'Borsa Italiana'] ],
				attributes: [ ['last_price', 'borsa_italiana_resistance'], ['last_price', 'borsa_italiana_support'] ],
				info_title: 'Violazione trendline secondo "Borsa Italiana"',
				info_content: 'Violazione di resistenze e supporti secondo "Borsa Italiana"'
           },
           filter_2: {			        	   
				index: 1,
				active: true,
				title: 'Violazione trendline ',
				urls: ['/filters/filter_overResistanceSoleXXIVOre', '/filters/filter_belowSupportSoleXXIVOre'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/il-sole-24-ore-logo-small.png',
				    title: 'Supporti e resistenze da Il Sole 24 Ore',
				    alt: 'Supporti e resistenze da Il Sole 24 Ore'
				},						
				captions: ['Resistenza', 'Supporto'],
				table_headers: [ ['Nome', 'Ultimo prezzo', 'Il sole 24 ore'], ['Nome', 'Ultimo prezzo', 'Il Sole 24 Ore'] ],
				attributes: [ ['last_price', 'xxivore_resistance'], ['last_price', 'xxivore_support'] ],
				info_title: 'Violazione trendline per "Il Sole 24 Ore"',
				info_content: 'Violazione di resistenze e supporti secondo "Il sole 24 ore"'
           },
           filter_3: {			        	   
				index: 2,
				active: true,
				title: 'Violazione trendline ',
				urls: ['/filters/filter_overResistanceRepubblica', '/filters/filter_belowSupportRepubblica'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/la-repubblica-logo-small.png',
				    title: 'Supporti e resistenze da La Repubblica',
				    alt: 'Supporti e resistenze da La Repubblica'
				},						
				captions: ['Resistenza', 'Supporto'],
				table_headers: [ ['Nome', 'Ultimo prezzo', 'La Repubblica'], ['Nome', 'Ultimo prezzo', 'La Repubblica'] ],
				attributes: [ ['last_price', 'repubblica_resistance'], ['last_price', 'repubblica_support'] ],
				info_title: 'Violazione trendline per "La Repubblica"',
				info_content: 'Violazione di resistenze e supporti secondo "La Repubblica"'
           },
           
           filter_4: {			        	   
				index: 3,
				active: true,
				title: 'Indicazioni da ',
				urls: ['/filters/filter_suggestionsMilanoFinanza'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/milano-finanza-logo-small.png',
				    title: 'Indicazioni da Milano Finanza',
				    alt: 'Indicazioni da Milano Finanza'
				},						
				captions: [],
				table_headers: [ ['Nome', 'Ultimo prezzo', 'MF Risk', 'MF Rating'] ],
				attributes: [ ['last_price', 'milano_finanza_risk', 'milano_finanza_rating'] ],
				info_title: 'Indicazioni da "Milano Finanza"',
				info_content: 'Titoli con "MF Risk" minore di 25 e "MF Rating" almeno B secondo le analisi di "Milano Finanza"'
           },
           
           filter_5: {			        	   
				index: 4,
				active: true,
				title: 'Indicazioni da  ',
				urls: ['/filters/filter_suggestionsSoleXXIVOre'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/il-sole-24-ore-logo-small.png',
				    title: 'Indicazioni da Il Sole 24 Ore',
				    alt: 'Indicazioni da Il Sole 24 Ore'
				},						
				captions: [],
				table_headers: [ ['Nome', 'Ultimo prezzo', 'Short Trend', 'FTA Index', 'RSI'] ],
				attributes: [ ['last_price', 'xxivore_shorttrend', 'xxivore_ftaindex', 'xxivore_rsi'] ],
				info_title: 'Indicazioni da "Il Sole 24 Ore"',
				info_content: 'Titoli con "Short trend" "Molto rialzista" e "FTA Index" di almeno 50 e "RSI" almeno 75 secondo le analisi de "Il Sole 24 Ore"'
          },
          
          filter_6: {			        	   
				index: 5,
				active: true,
				title: 'Indicazioni da ',
				urls: ['/filters/filter_suggestionsInvestingDotCom'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/investing-logo-small.png',
				    title: 'Indicazioni da Investing.com',
				    alt: 'Indicazioni da Investing.com'
				},						
				captions: [],
				table_headers: [ ['Nome', 'Ultimo prezzo'] ],
				attributes: [ ['last_price'] ],
				info_title: 'Indicazioni da Investing.com',
				info_content: 'Titoli con valutazione "Compra ora" nel frame temporale giornaliero e mensile secondo le analisi di "Investing.com"'
				},
				



				filter_7: {			        	   
					index: 6,
					active: pageData.islogged,
					title: 'Violazione trendline Analisi personali',
					urls: ['/filters/filter_overResistanceStocksOnStudy', '/filters/filter_belowSupportStocksOnStudy'],						
					captions: ['Resistenza', 'Supporto'],
					table_headers: [ ['Nome', 'Ultimo prezzo', 'Resistenza'], ['Nome', 'Ultimo prezzo', 'Supporto'] ],
					attributes: [ ['last_price', 'resistance'], ['last_price', 'support'] ],
					info_title: 'Violazione trendline Analisi personali',
					info_content: 'Violazione di resistenze e supporti secondo le tue Analisi personali'
					},


					filter_8: {			        	   
						index: 7,
						active: pageData.islogged,
						title: 'Rafforzamento del trend in atto',
						urls: ['/filters/filter_trendReinforcement'],						
						captions: [],
						table_headers: [ ['Nome', 'Ultimo prezzo', 'Posizione', 'Pattern', 'Candlestick'] ],
						attributes: [ ['last_price', 'trading_position', 'continuation_chart_pattern', 'continuation_candlestick'] ],
						info_title: 'Rafforzamento del trend in atto',
						info_content: 'Rafforzamento del trend in atto secondo le tue Analisi personali'
						},

						filter_9: {			        	   
							index: 8,
							active: pageData.islogged,
							title: 'Cambiamento del trend in atto',
							urls: ['/filters/filter_trendChanging'],						
							captions: [],
							table_headers: [ ['Nome', 'Ultimo prezzo', 'Posizione', 'Pattern', 'Candlestick', 'Div. RSI', 'Div, Stocastico'] ],
							attributes: [ ['last_price', 'trading_position', 'reversal_chart_pattern', 'reversal_candlestick', 'rsi_divergence', 'stoch_divergence'] ],
							info_title: 'Rafforzamento del trend in atto',
							info_content: 'Rafforzamento del trend in atto secondo le tue Analisi personali'
							}


	}

	return {
		
		setPageData : function() {
			if ($inputElem.length > 0) {
				_pageData.isin = $inputElem.data('isin');
				_pageData.user = $inputElem.data('user');
				_pageData.isAdmin = $inputElem.data('isadmin');
				_pageData.islogged = $inputElem.data('islogged');
			}
		},
		
		
		getPageData : function() {
			return _pageData;
		},
		
		getHPFilters : function() {
			return HPFilters;
		},


		manageWindowPosition : function() {

			var active = true;
			var offset1 = 0;
			var offset2 = 0;

			var checkPosition = utils.debounce(function() {
				if (active && window.pageYOffset >= offset1) {
					active = false;
				}
				if (window.pageYOffset >= offset2) {
				}
			}, 50);

			checkPosition();

			$(window).scroll(function() {
				checkPosition();
			});
		},
		

		scrollDown : function() {
			$('#scrolldown').click(function(e) {
				e.preventDefault();
				$('body').scrollTo($('#elem'), 800);
			});
		},
		
		
		getParameterByName: function(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, "\\$&");
		    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return '';
		    return decodeURIComponent(results[2].replace(/\+/g, " "));
		},
		
		
		fixHREFs: function() {
			var milanoFinanzaUrl = 'https://www.milanofinanza.it';
		    $links = $mainContainer.find('.milano-finanza a');
		    $linksToDisable = $mainContainer.find('.milano-finanza table a');
		    $links.each(function() {
		    	var actualHREF = $(this).attr('href');
		    	var newHREF = milanoFinanzaUrl + actualHREF;
		    	$(this).attr('href', newHREF);
		    });
		    
		    $linksToDisable.click(function(e) {
		    	e.preventDefault();
		    })
		    
		},
		
		
		initPopOvers: function() {
			$('#main-wrapper').find('[data-toggle="popover"]').popover();		    
		},
		
	
		loadSources : function() {
			
			var sourcesPromise = new Promise(function(resolve, reject) {
				var isin = tradingRadar.getPageData().isin;
				var $destinations = $mainContainer.find('.ext-source .pr-section');
				var count = 0;
				
				$destinations.each(function(index, elem) {
					var url = '/sources/source' + (index+1) + '?isin=' + isin;
					var currentSource = $(this).parents('.ext-source').attr('id');
					var $currentImageAnchor = $('.anchors').find('img[data-refers="' + currentSource + '"]');
					var $target = $(this);
					
					$.ajax({
						url : url,
						data : 'text/html',
						type : 'get',
						success : function(data) {
							var content = $(data).html();
							$target.html(content);
						},
						error : function() {
							console.error('Unable to perform request');
							$target.addClass('error');
							$currentImageAnchor.addClass('error');
						},
						complete : function() {						
							$target.addClass('loaded');
							$currentImageAnchor.addClass('ready');
							count++;
							if(count == $destinations.length) {
								resolve();
							}
						}
					});
					
					
				});
				
			}).then(function() {
				tradingRadar.fixHREFs();
			}).catch(function(err) {
    			console.error(err);
    		});
			
			
		},
		
		
		highlightStocks : function() {
			
			$('.suggestions table:first-child tr').each(function() {			
				var isin = $(this).data('isin');
				var $occurences = $('.suggestions tr[data-isin=' + isin + ']');
				
				var count = $occurences.length			
				if(count>=3) {
					$occurences.addClass('repeated');
				}
			});
			
			
			$('.break-outs table.Resistance').eq(0).find('tr').each(function() {			
				var isin = $(this).data('isin');
				var $occurences = $('.break-outs table.Resistance tr[data-isin=' + isin + ']');
				
				var count = $occurences.length			
				if(count>=3) {
					$occurences.addClass('repeated red');
				}
			});
			
			
			$('.break-outs table.Support').eq(0).find('tr').each(function() {	
				var isin = $(this).data('isin');
				var $occurences = $('.break-outs table.Support tr[data-isin=' + isin + ']');
				
				var count = $occurences.length
				if(count>=3) {
					$occurences.addClass('repeated green');
				}
			});
		},
		
		

		loadHPFilters : function() {
			
			var filters = tradingRadar.getHPFilters();
			
			var filtersCount = Object.keys(filters).length;
			var filtersWorked = 0;
			
			var filtersPromise = new Promise(function(resolve, reject) {
				for (var filter in filters) {
					
				    if (filters.hasOwnProperty(filter)) {
				    	
				    	
				    	var filterPromise = new Promise(function(resolve, reject) {
								var obj = filters[filter];
								
								if (!obj.active ) {
									resolve();
								}

					    	var $filter = $mainContainer.find('.filters .hp-filter:eq(' + obj.index + ')');
					    	var $titleElem = $filter.find('h2');
					    	var $contentElem = $filter.find('.x_content');
					    	var $infoPopOver = $filter.find('.info-pop-over');
					    	var count = 0;
					    	
					    	$titleElem.html(obj.title);
					    	
					    	var $ico = $('<img/>', obj.icon).appendTo($titleElem);
					    	
					    	$infoPopOver.attr('data-title', obj.info_title);
					    	$infoPopOver.attr('data-content', obj.info_content);
					    					    
					    	
					    	obj.urls.forEach(function(url, index) {
					    		
					    		var $table = $('<table/>', {
								    class: 'tablesorter ' + obj.captions[index]
								}).appendTo($contentElem);
					    		
					    		var $caption = $('<caption/>', {
								    text: obj.captions[index]
								});
						    	$table.append($caption);
						    	
						    	var thead = '';
								thead = '<thead><tr>';
								obj.table_headers[index].forEach(function(theader) {
									thead += '<th>' + theader + '</th>';
								});
								thead += '</tr></thead>';
						        $table.append(thead);					        				       
						        
						        $.ajax({
									url : url,
									data : 'text/json',
									type : 'get',
									success : function(response) {				

										var tbody = '<tbody>';
								        $.each(response, function (i, item) {
								        	var rowClass = i%2===0 ? 'even' : 'odd';
								        	
								        	tbody += '<tr class="' + rowClass + '" data-isin="' + item.isin + '">';
								        	tbody += '<td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td>';

								        	obj.attributes[index].forEach(function(attribute) {
												
												tbody += '<td>' + item[attribute] + '</td>';
											});
											tbody += '</tr>';
											tbody += '</tbody>';
								        	
								        });
								        
								        $table.append(tbody);
										
									},
									error : function(err) {
										console.error(err);	
										
									},
									complete : function() {
										count++;
										if(count === obj.urls.length) {
											$contentElem.addClass('loaded');	
											filtersWorked++;
											if (filtersCount == filtersWorked) {
												resolve();
											}
										}										
									}
								});
					    		
					    	});
					    	
					    	
					    	
					    	
			    		}).then(function() {
			    			resolve();
			    		}).catch(function(err) {
			    			console.error(err);
			    			reject();
			    		});
				    	
				    }
				}
			}).then(function() {
				tradingRadar.highlightStocks();
				tradingRadar.initPopOvers();
			}).catch(function(err) {
    			console.error(err);
    		});

			
					
			
		}

	}

}());

$(document).ready(function() {
	
	tradingRadar.setPageData();
	var pageData = tradingRadar.getPageData();

	
	// myApp.getMarketsStatus();


	/*
	 * if (pageData.device === "Desktop") { tradingRadar.manageWindowPosition();
	 * tradingRadar.scrollDown(); }
	 * 
	 * if (pageData.device === "Mobile") {
	 *  }
	 */

	$('#main-wrapper').find(".tablesorter:not(.nojs)").tablesorter();
	
	
	
	//$('#main-wrapper').find('[data-toggle="popover"]').popover();
	
	
	/*
	 * $.when( myApp.loadHPFilters() ).done(function() {
	 * myApp.highlightStocks(); });
	 */
	
	// setTimeout(myApp.highlightStocks(), 3000);
	
	
	
	
	
	
	if($('.stock_page').length) { 
		tradingRadar.loadSources();		
	}
	
	
	if($('.welcome').length) {
		tradingRadar.loadHPFilters();
		
	}
	


});

