var myApp = (function() {

	var _pageData = {};

	var $mainContainer = $('#main-wrapper');
	var $inputElem = $('#pageData');

	return {

		setPageData : function() {
			if ($inputElem.length > 0) {
				_pageData.country = $inputElem.data('country');
				_pageData.device = $inputElem.data('device');
			}
		},

		getPageData : function() {
			return _pageData;
		},

		manageLazyLoading : function() {
			$.extend($.lazyLoadXT, {
				edgeY : 200,
				visibleOnly : false
			});
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

		setCustomCursor : function($container) {
			$container.append('<div id="customCursor">Custom cursor</div>');
			$container.on('mousemove', function(ev) {
				$('#customCursor').css(
						{
							'transform' : 'translateY(' + ev.offsetY
									+ 'px) translateX(' + ev.offsetX + 'px)',
							'top' : 'auto',
							'left' : 'auto'
						});
			});
			$container.on('mouseenter', function() {
				$('#customCursor').css('opacity', 1);
			});
			$container.on('mouseleave', function() {
				$('#customCursor').css('opacity', 0);
			});
		},

		scrollDown : function() {
			$('#scrolldown').click(function(e) {
				e.preventDefault();
				$('body').scrollTo($('#elem'), 800);
			});
		},

		loadHPFilters : function() {
			/*$('.hp-filter').each(function(index, elem) {
				var $titleElem = $(this).find('h2');
				var $contentElem = $(this).find('.x_content');

				var url = '/filters/filter_' + (index + 1);

				jQuery.ajax({
					url : url,
					data : 'text/html',
					type : 'get',
					success : function(data) {
						var title = $(data).find('h2').html();
						var content = $(data).find('table');
						$titleElem.html(title);
						$contentElem.html(content);
					},
					error : function() {
						console.log('error');
					},
					complete : function() {
					}
				});

			});*/
			
			$('.hp-filter').each(function(index, elem) {
				var $titleElem = $(this).find('h2');
				var $contentElem = $(this).find('.x_content');
				
				switch (index) {
				
				case 0:
					
					$titleElem.html('Channels break out');
					
					var url = '/filters/filter_1';
					var url2 = '/filters/filter_1b';
					
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
										
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var caption = $('<caption/>', {
							    text: 'Resistance'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Borsa Italiana</th><th>Il Sole 24 Ore</th><th>Repubblica</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.borsa_italiana_resistance + '</td><td>' + item.xxivore_resistance + '</td><td>' + item.repubblica_resistance + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
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
							    text: 'Support'
							});
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th><th>Borsa Italiana</th><th>Il Sole 24 Ore</th><th>Repubblica</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.borsa_italiana_resistance + '</td><td>' + item.xxivore_resistance + '</td><td>' + item.repubblica_resistance + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
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
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.xxivore_shorttrend + '</td><td>' + item.xxivore_ftaindex + '</td><td>' + item.xxivore_rsi + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
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
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
						}
					});
					break;
					
					
				case 3:
					
					$titleElem.html('Over limits studies (update needed)');
					
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
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.resistance + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
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
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td><td>' + item.support + '</td></tr>';
					        });
					        $table.append(caption);
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
						}
					});
					break;
					
					
				case 4:
					var url = '/filters/filter_5';
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							$titleElem.html('Rising crossing stocks');
							
							/*var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/il-sole-24-ore-logo.png',
							    title: 'Il Sole 24 Ore',
							    alt: 'Logo Il Sole 24 Ore'
							}).appendTo($titleElem);*/				
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
						}
					});
					break;
					
					
				case 5:
					var url = '/filters/filter_6';
					$.ajax({
						url : url,
						data : 'text/json',
						type : 'get',
						success : function(response) {
							
							$titleElem.html('Bullish divergence stocks');
							
							/*var $ico = $('<img/>', {
							    class: 'img-logo-small',
							    src: '/images/il-sole-24-ore-logo.png',
							    title: 'Il Sole 24 Ore',
							    alt: 'Logo Il Sole 24 Ore'
							}).appendTo($titleElem);*/				
							
							var $table = $('<table/>', {
							    class: 'tablesorter'
							}).appendTo($contentElem);
							
							var theadHTML = '';
							theadHTML = '<thead><tr><th>Name</th><th>Last price</th></tr></thead>'
							
							var trHTML = '';
					        $.each(response, function (i, item) {
					        	var rowClass = i%2===0 ? 'even' : 'odd';
					            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td></tr>';
					        });
					        $table.append(theadHTML);
					        $table.append(trHTML);
							
						},
						error : function() {
							console.log('error');
						},
						complete : function() {
						}
					});
					break;

				default:
					break;
				}

				/*var url = '/filters/filter_' + (index + 1);

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
				            trHTML += '<tr class="' + rowClass + '"><td><a href="' + '/stock_page/index?isin=' + item.isin + '">' + item.name + '</a></td><td>' + item.last_price + '</td></tr>';
				        });
				        $table.append(theadHTML);
				        $table.append(trHTML);
						
					},
					error : function() {
						console.log('error');
					},
					complete : function() {
					}
				});*/

			});
			
		}

	};

}());

$(document).ready(function() {

	myApp.loadHPFilters();

	myApp.setPageData();

	var pageData = myApp.getPageData();

	myApp.manageLazyLoading();

	if (pageData.device === "Desktop") {
		myApp.manageWindowPosition();
		myApp.scrollDown();
	}

	if (pageData.device === "Mobile") {

	}

	$(".tablesorter").tablesorter();

	// $('.pr-section a').removeAttr('href onclick style');

});

// var big = (x > 10) ? true : false;

// var big = (x > 10) ? "greater 10" : (x < 5) ? "less 5" : "between 5 and 10";

// var variable2 = variable1 || '';

// var a = ["myString1", "myString2", "myString3"];

/*
 * var skillSet = { 'Document language' : 'HTML5', 'Styling language' : 'CSS3',
 * 'Javascript library' : 'jQuery', 'Other' : 'Usability and accessibility' };
 */

// var x, y, z=3;
// if (likeJavaScript)
/*
 * var a; if ( !a ) { // do something... }
 */

/*
 * function myFunction() { console.log( arguments.length ); // Returns 5 for ( i =
 * 0; i < arguments.length; i++ ) { console.log( typeof arguments[i] ); //
 * Returns string, number, object, object, boolean } } myFunction( "String", 1,
 * [], {}, true );
 * 
 */

/*
 * for(var i in allImgs)
 */

// "myString"[0]; // Returns 'm'
// return ret || fum('g2g');
/*
 * function x() {console.log('x')};function y() {console.log('y')};var z = 3;
 * (z==3?x:y)(); // Short version!
 */

/*
 * var cases = { 1: doX, 2: doY, 3: doN }; if (cases[something]) {
 * cases[something](); }
 */

// if([1,5,7,22].indexOf(myvar)!=-1) alert('yeah baby!')
/*
 * var types = { aligator: aligatorBehavior, parrot: parrotBehavior, dolphin:
 * dolphinBehavior, bulldog: bulldogBehavior };
 * 
 * var func = types[type]; if (!func) throw new Error('Invalid animal ' + type);
 * func();
 */

// ~~4.9 === 4 //true
/*
 * function documentTitle(theTitle) theTitle = theTitle || "Untitled Document"; }
 */

/*
 * function isAdult(age) { return age && age > 17 ; }
 */
