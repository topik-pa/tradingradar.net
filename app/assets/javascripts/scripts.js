var tradingRadar = (function() {

	var _pageData = {};	
	var $inputElem = $('#pageData');

	var $mainContainer = $('#main-wrapper');
	
	
	var HPFilters = {
			filter_1: {			        	   
				index: 0,
				title: 'Channels break out ',
				urls: ['/filters/filter_overResistanceBorsaItaliana', '/filters/filter_belowSupportBorsaItaliana'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/borsa-italiana-logo.png',
				    title: 'Borsa Italiana',
				    alt: 'Logo Borsa Italiana'
				},						
				captions: ['Resistance', 'Support'],
				table_headers: [ ['Name', 'Last price', 'Borsa Italiana'], ['Name', 'Last price', 'Borsa Italiana'] ],
				attributes: [ ['last_price', 'borsa_italiana_resistance'], ['last_price', 'borsa_italiana_support'] ],
				info_title: 'Channels break out Borsa Italiana',
				info_content: 'Violazione di resistenze e supporti secondo Borsa Italiana'
           },
           filter_2: {			        	   
				index: 1,
				title: 'Channels break out ',
				urls: ['/filters/filter_overResistanceSoleXXIVOre', '/filters/filter_belowSupportSoleXXIVOre'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/il-sole-24-ore-logo.png',
				    title: 'Il sole 24 ore',
				    alt: 'Logo Il sole 24 ore'
				},						
				captions: ['Resistance', 'Support'],
				table_headers: [ ['Name', 'Last price', 'Il sole 24 ore'], ['Name', 'Last price', 'Il sole 24 ore'] ],
				attributes: [ ['last_price', 'xxivore_resistance'], ['last_price', 'xxivore_support'] ],
				info_title: 'Channels break out IL sole 24 ore',
				info_content: 'Violazione di resistenze e supporti secondo Il sole 24 ore'
           },
           filter_3: {			        	   
				index: 2,
				title: 'Channels break out ',
				urls: ['/filters/filter_overResistanceRepubblica', '/filters/filter_belowSupportRepubblica'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/la-repubblica-logo.png',
				    title: 'La Repubblica',
				    alt: 'Logo La Repubblica'
				},						
				captions: ['Resistance', 'Support'],
				table_headers: [ ['Name', 'Last price', 'La Repubblica'], ['Name', 'Last price', 'La Repubblica'] ],
				attributes: [ ['last_price', 'repubblica_resistance'], ['last_price', 'repubblica_support'] ],
				info_title: 'Channels break out La Repubblica',
				info_content: 'Violazione di resistenze e supporti secondo La Repubblica'
           },
           
           filter_4: {			        	   
				index: 3,
				title: 'Suggestions from ',
				urls: ['/filters/filter_suggestionsMilanoFinanza'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/milano-finanza-logo.png',
				    title: 'Milano Finanza',
				    alt: 'Logo Milano Finanza'
				},						
				captions: [],
				table_headers: [ ['Name', 'Last price', 'MF Risk', 'MF Rating'] ],
				attributes: [ ['last_price', 'milano_finanza_risk', 'milano_finanza_rating'] ],
				info_title: 'Suggerimenti da Milano Finanza',
				info_content: 'Titoli con "MF Risk" minore di 25 e "MF Rating" almeno B'
           },
           
           filter_5: {			        	   
				index: 4,
				title: 'Suggestions from ',
				urls: ['/filters/filter_suggestionsSoleXXIVOre'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/il-sole-24-ore-logo.png',
				    title: 'Il sole 24 ore',
				    alt: 'Logo Il sole 24 ore'
				},						
				captions: [],
				table_headers: [ ['Name', 'Last price', 'Short Trend', 'FTA Index', 'RSI'] ],
				attributes: [ ['last_price', 'xxivore_shorttrend', 'xxivore_ftaindex', 'xxivore_rsi'] ],
				info_title: 'Suggerimenti da Il sole 24 ore',
				info_content: 'Titoli con "Short trend" "Molto rialzista" e "FTA Index" di almeno 50 e "RSI" almeno 75'
          },
          
          filter_6: {			        	   
				index: 5,
				title: 'Suggestions from ',
				urls: ['/filters/filter_suggestionsInvestingDotCom'],
				icon: {
				    class: 'img-logo-small',
				    src: '/images/investing-logo.png',
				    title: 'Investing',
				    alt: 'Logo Investing'
				},						
				captions: [],
				table_headers: [ ['Name', 'Last price'] ],
				attributes: [ ['last_price'] ],
				info_title: 'Suggerimenti da Investing',
				info_content: 'Titoli con valutazione "Compra ora" nel frame temporale giornaliero e mensile'
        }
	}

	return {
		
		setPageData : function() {
			if ($inputElem.length > 0) {
				_pageData.isin = $inputElem.data('isin');
				_pageData.user = $inputElem.data('user');
				_pageData.isAdmin = $inputElem.data('isadmin');
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
		    $links = $mainContainer.find('#milano-finanza a');
		    $links.each(function() {
		    	var actualHREF = $(this).attr('href');
		    	var newHREF = milanoFinanzaUrl + actualHREF;
		    	$(this).attr('href', newHREF);
		    });
		    
		},
		
		
		initPopOvers: function() {
			$('#main-wrapper').find('[data-toggle="popover"]').popover();		    
		},
		
	
		loadSources : function() {
			
			var sourcesPromise = new Promise(function(resolve, reject) {
				var containerSelector = '.x_panel';
				var isin = _pageData.isin;
				var $targets = $mainContainer.find('.press-release .ext-source');
				var count = 0;
				
				$targets.each(function(index, elem) {				
					var url = '/sources/source' + (index+1) + '?isin=' + isin;
					var $destination = $(this).find(containerSelector);
					var currentSource = $(this).attr('id');
					var $currentImageAnchor = $('.anchors').find('img[data-refers="' + currentSource + '"]');
					
					$.ajax({
						url : url,
						data : 'text/html',
						type : 'get',
						success : function(data) {
							var content = $(data).find(containerSelector).html();
							$destination.html(content);
						},
						error : function() {
							console.error('Unable to perform request');
							$destination.addClass('error');
							$currentImageAnchor.addClass('error');
						},
						complete : function() {						
							$destination.addClass('loaded');
							$currentImageAnchor.addClass('ready');
							count++;
							if(count == $targets.length) {
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

