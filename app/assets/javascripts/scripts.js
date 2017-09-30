var tradingRadar = (function() {

	var _pageData = {};	
	var $inputElem = $('#pageData');

	var $mainContainer = $('#main-wrapper');

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
		
		
		loadSources : function() {
			var containerSelector = '.x_panel';
			var isin = _pageData.isin;
			var $targets = $mainContainer.find('.press-release .ext-source');
			$targets.each(function(index, elem) {				
				var url = '/sources/source' + (index+1) + '?isin=' + isin;
				var $destination = $(this).find(containerSelector);
				
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
					},
					complete : function() {
						$destination.addClass('loaded');
					}
				});
				
				
			});
		},

		loadHPFilters : function() {
			
			var filters = {
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
						attributes: [ ['last_price', 'borsa_italiana_resistance'], ['last_price', 'borsa_italiana_support'] ]
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
						attributes: [ ['last_price', 'xxivore_resistance'], ['last_price', 'xxivore_support'] ]
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
						attributes: [ ['last_price', 'repubblica_resistance'], ['last_price', 'repubblica_support'] ]
		           }
			}
	           
          
			
			
			for (var filter in filters) {
			    if (filters.hasOwnProperty(filter)) {
			    	
			    	var obj = filters[filter];

			    	var $filter = $mainContainer.find('.filters .hp-filter:eq(' + obj.index + ')');
			    	var $titleElem = $filter.find('h2');
			    	var $contentElem = $filter.find('.x_content');
			    	var count = 0;
			    	
			    	$titleElem.html(obj.title);
			    	
			    	var $ico = $('<img/>', obj.icon).appendTo($titleElem);
			    	
		    	
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
							error : function() {
								console.log('error');
							},
							complete : function() {
								count++;
								if(count === obj.urls.length) {
									$(document).trigger("filterComplete");
									$contentElem.addClass('loaded');
								}
								
							}
						});
			    		
			    	});
			    	
			    }
			}
			
			/*$targets = $mainContainer.find('.filters .hp-filter').each(function(index, elem) {
				var $titleElem = $(this).find('h2');
				var $contentElem = $(this).find('.x_content');
				
				switch (index) {
				
				
				case 3:
					
					$titleElem.html('Channels break out ');
					
					var url = '/filters/filter_1c';
					var url2 = '/filters/filter_1f';
					
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							
							var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/borsa-italiana-logo.png',
							    title: 'Borsa Italiana',
							    alt: 'Logo Borsa Italiana'
							}).appendTo($titleElem);
										
							
							var $table = $('<table/>', {
							    class: 'tablesorter resistance'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Resistance'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Borsa Italiana</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.borsa_italiana_resistance + '</td>></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					
					$.ajax({
						url : url2,
						data : 'text/json',
						type : 'get',
						success : function(response) {
			
							
							var $table = $('<table/>', {
							    class: 'tablesorter support'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Support'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Borsa Italiana</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.borsa_italiana_support + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					
					
					
					
				case 4:
					
					$titleElem.html('Channels break out ');
					
					var url = '/filters/filter_1d';
					var url2 = '/filters/filter_1g';
					
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							
							var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/il-sole-24-ore-logo.png',
							    title: 'Il Sole 24 Ore',
							    alt: 'Logo Il Sole 24 Ore'
							}).appendTo($titleElem);
										
							
							var $table = $('<table/>', {
							    class: 'tablesorter resistance'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Resistance'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Il Sole 24 Ore</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.xxivore_resistance + '</td>></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					
					$.ajax({
						url : url2,
						data : 'text/json',
						type : 'get',
						success : function(response) {
			
							
							var $table = $('<table/>', {
							    class: 'tablesorter support'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Support'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Il Sole 24 Ore</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.xxivore_support + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					
					
				case 5:
					
					$titleElem.html('Channels break out ');
					
					var url = '/filters/filter_1e';
					var url2 = '/filters/filter_1h';
					
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							
							var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/la-repubblica-logo.png',
							    title: 'La Repubblica',
							    alt: 'Logo La Repubblica'
							}).appendTo($titleElem);
										
							
							var $table = $('<table/>', {
							    class: 'tablesorter resistance'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Resistance'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>La Repubblica</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.repubblica_resistance + '</td>></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					
					$.ajax({
						url : url2,
						data : 'text/json',
						type : 'get',
						success : function(response) {
			
							
							var $table = $('<table/>', {
							    class: 'tablesorter support'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Support'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>La Repubblica</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.repubblica_support + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					

					
				case 1:
					var url = '/filters/filter_2';
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							$titleElem.html('Suggestions from ');
							
							var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/il-sole-24-ore-logo.png',
							    title: 'Il Sole 24 Ore',
							    alt: 'Logo Il Sole 24 Ore'
							}).appendTo($titleElem);				
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Short Trend</th><th>FTA Index</th><th>RSI</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.xxivore_shorttrend + '</td><td>' + item.xxivore_ftaindex + '</td><td>' + item.xxivore_rsi + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					
					
					
				case 2:
					var url = '/filters/filter_3';
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							$titleElem.html('Suggestions from ');
							
							var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/investing-logo.png',
							    title: 'Investing',
							    alt: 'Logo Investing'
							}).appendTo($titleElem);					
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					
				case 8:
					
					$titleElem.html('Over limits studies');
					
					var url = '/filters/filter_4';
					var url2 = '/filters/filter_4b';
					
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
										
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Resistance breakout'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Resistance</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.resistance + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					
					$.ajax({
						url : url2,
						data : 'text/json',
						type : 'get',
						success : function(response) {
										
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Support breakout'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Resistance</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.support + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					
				case 6:
					var url = '/filters/filter_5';
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							$titleElem.html('Rising crossing stocks');
			
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					
				case 7:
					var url = '/filters/filter_6';
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							$titleElem.html('Bullish divergence stocks');
			
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					
				case 0:
					var url = '/filters/filter_7';
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							$titleElem.html('Suggestions from ');
							
							var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/milano-finanza-logo.png',
							    title: 'Milano Finanza',
							    alt: 'Logo Milano Finanza'
							}).appendTo($titleElem);			
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>MF Risk</th><th>MF Rating</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '" data-isin="' + item.isin + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.milano_finanza_risk + '</td><td>' + item.milano_finanza_rating + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
							$(document).trigger("filterComplete");
							$contentElem.addClass('loaded');
						}
					});
					break;
					
					

				default:
					break;
				}
			});*/
				
			

			
			
		},
		
		
		
		highlightStocks : function() {
			
			var totalCalls = 13// $('.filters table').length;
			var actualCalls = 0;
			
			
			$(document).on("filterComplete", function() {
				
				
				actualCalls++;
				
				if(actualCalls==totalCalls) {
					$('.suggestions table:first-child tr').each(function() {
						
						var isin = $(this).data('isin');
						var $occurences = $('.suggestions tr[data-isin=' + isin + ']');
						
						var count = $occurences.length
						
						if(count>=3) {
							$occurences.addClass('repeated');
						}
					});
					
					
					$('.break-outs table.resistance').eq(0).find('tr').each(function() {
						
						var isin = $(this).data('isin');
						var $occurences = $('.break-outs table.resistance tr[data-isin=' + isin + ']');
						
						var count = $occurences.length
						
						if(count>=3) {
							$occurences.addClass('repeated red');
						}
					});
					
					
					$('.break-outs table.support').eq(0).find('tr').each(function() {
						
						var isin = $(this).data('isin');
						var $occurences = $('.break-outs table.suppor tr[data-isin=' + isin + ']');
						
						var count = $occurences.length
						
						if(count>=3) {
							$occurences.addClass('repeated green');
						}
					});
				}
			});
			
			
			
			
		},

		
		
		/*
		 * getMarketsStatus : function() { var url =
		 * 'https://www.stockmarketclock.com/api-v1/list'; var source;
		 * 
		 * $.ajax({ url : url, dataType: "html", type : 'get', success :
		 * function(response) {
		 * 
		 * source = response;
		 * 
		 * 
		 *  }, error : function() { console.log('error'); }, complete :
		 * function() { } });
		 * 
		 * 
		 * $('.markets-status li').each(function() {
		 * 
		 * }); },
		 */

	};

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

	$(".tablesorter:not(.nojs)").tablesorter();
	
	
	
	$('[data-toggle="popover"]').popover();
	
	
	/*
	 * $.when( myApp.loadHPFilters() ).done(function() {
	 * myApp.highlightStocks(); });
	 */
	
	// setTimeout(myApp.highlightStocks(), 3000);
	
	// tradingRadar.highlightStocks();
	
	
	
	
	if($('.stock_page').length) {
		tradingRadar.loadSources();
	}
	
	
	if($('.welcome').length) {
		tradingRadar.loadHPFilters();
	}
	


});

