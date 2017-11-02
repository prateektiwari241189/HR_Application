/**
 * Custom Javascript for Edition
 *
 * @package WordPress
 * @subpackage Edition
 * @since Edition 1.0
 */

// Set jQuery to NoConflict Mode
jQuery.noConflict();

(function ($) {
	"use strict";

	/**
	 * Converts html image to full fixed background
	 * @since v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.parallaxImg = function(){
		$(this).each(function(){
			var $this 		= jQuery(this),
				parallaxsrc = $this.attr('src'),
				captionDiv 	= $this.closest('.wp-caption');

			// If there's a caption set
			if (captionDiv.length) {
				captionDiv.removeClass('wp-caption').addClass('post-break has-caption').css('width', 'auto');
				$this.before('<span class="full-bg-image" style="background-image: url('+parallaxsrc+');"></span>');
			} else {
				$this.before('<span class="post-break"><span class="full-bg-image" style="background-image: url('+parallaxsrc+');"></span></span>');
			}
			$this.remove();
		});
	}

	/**
	 * Uses javascript to submit search terms to prevent empty searches
	 * @since v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.searchSubmit = function() {

		$(this).each(function() {
			var $this    	 = $(this),
				searchbox    = $this.find('input'),
	            searchForm   = $this.find('form'),
	            submitBtn    = $this.find('.searchbutton');

			function validate(){
	          if (searchbox.val().length > 0) {
	            searchForm.submit();
	          }
	        }

	        $this.on('click', function() {
	        	searchbox.focus();
	        });

		    submitBtn.click(function(){
	          validate();
	        });
		});

	}

	/**
	 * Calls lightbox links
	 * @since  v1.0
	 */
	$.fn.themewichLightbox = function() {

		var attachments = jQuery("a.themewich-lightbox, a[rel*='attachment']");

		attachments.magnificPopup({
			type:'image',
			closeBtnInside: true,
			tLoading: '<div class="loading"></div>',
			mainClass: 'mfp-zoom-in',
			removalDelay: 500, //delay removal by X to allow out-animation
			image: {
				tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
				titleSrc: function(item) {
				  return item.el.find('img').attr('title');
				},
				 markup: '<div class="mfp-figure">'+
				'<div class="mfp-close"></div>'+
				'<div class="mfp-img"></div>'+
				'<div class="mfp-bottom-bar">'+
				  '<div class="mfp-title-wrapper"><div class="mfp-title"></div></div>'+
				  '<div class="mfp-counter"></div>'+
				'</div>'+
			  '</div>' // Popup HTML markup. `.mfp-img` div will be replaced with img tag, `.mfp-close` by close button
			},
			callbacks: {
				imageLoadComplete: function() {
				  var self = this;
				  setTimeout(function() {
					self.wrap.addClass('mfp-image-loaded');
				  }, 16);
				},
				close: function() {
				  this.wrap.removeClass('mfp-image-loaded');
				}
			},
			closeOnContentClick: true,
			midClick: true
		});

		$('.open-popup-link').magnificPopup({
			type: 'inline',
			removalDelay: 500, //delay removal by X to allow out-animation
			fixedContentPos: false,
			fixedBgPos: true,
			tLoading: '<div class="loading"></div>',

			overflowY: 'auto',

			closeBtnInside: true,
			preloader: false,
			callbacks: {
				imageLoadComplete: function() {
				  var self = this;
				  setTimeout(function() {
					self.wrap.addClass('mfp-image-loaded');
				  }, 16);
				},
				close: function() {
				  this.wrap.removeClass('mfp-image-loaded');
				}
			},

			midClick: true,
			mainClass: 'mfp-zoom-in'
		});

		$('.popup-with-move-anim').magnificPopup({
          type: 'inline',

          fixedContentPos: false,
          fixedBgPos: true,

          overflowY: 'auto',

          closeBtnInside: true,
          preloader: false,

          midClick: true,
          removalDelay: 300,
          mainClass: 'my-mfp-slide-bottom'
        });

		jQuery('.gallery').each(function() {

			jQuery(this).magnificPopup({
				delegate: 'a.lightbox-gallery:not(.bx-clone a.lightbox-gallery)',
				type: 'image',
				closeBtnInside: true,
				tLoading: '<div class="loading"></div>',
				mainClass: 'mfp-zoom-in',
				removalDelay: 500, //delay removal by X to allow out-animation
				gallery: {
					enabled: true,
					navigateByImgClick: true,
					preload: [0,1] // Will preload 0 - before current, and 1 after the current image
				},
				image: {
					tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
					titleSrc: function(item) {
					  return item.el.find('img').attr('title');
					},
					 markup: '<div class="mfp-figure">'+
						'<div class="mfp-close"></div>'+
						'<div class="mfp-img"></div>'+
						'<div class="mfp-bottom-bar">'+
						  '<div class="mfp-title-wrapper"><div class="mfp-title"></div></div>'+
						  '<div class="mfp-counter"></div>'+
						'</div>'+
					  '</div>' // Popup HTML markup. `.mfp-img` div will be replaced with img tag, `.mfp-close` by close button
				},
				callbacks: {
					imageLoadComplete: function() {
					  var self = this;
					  setTimeout(function() {
						self.wrap.addClass('mfp-image-loaded');
					  }, 16);
					},
					close: function() {
					  this.wrap.removeClass('mfp-image-loaded');
					}
				},
				closeOnContentClick: true,
				midClick: true
			});
		});
	}

	$.fn.ajaxLoadPosts = function() {

		var $selector = $(this);

		$selector.click(function(){

			var $this 			= $(this),
				$othertabs 		= $this.closest('.tabswrap').find('a'),
				$query 			= $this.attr('data-query'),
				$content 		= $this.closest('.tabswrap').find('.tabs-content'),
				$numposts		= $content.attr('data-posts'),
				$contentheight 	= $content.height(),
				$loading 		= $content.closest('.tabswrap').find('.loading');

	    	$othertabs.removeClass('active');
	    	$this.addClass('active');

	        jQuery.ajax({
		        type: 'POST',
		        url: agAjax.ajaxurl,
		        data: {
		        'action': 'themewich_load_widget_posts',
		        'query': $query,
		        'posts' : $numposts,
		        'cache' : false
	        },
	        beforeSend: function() {

	        	$loading.fadeIn(500);

	        	$content.stop().animate({'opacity' : '0'}, 250, function() {
	        		$content.css('height', $contentheight);
	        	}); },
	        success: function(data, textStatus, XMLHttpRequest) {

	            var $newItems = '';

	            for (var entry in data) {
	            	if (typeof data[entry] == 'object') {

		                var title = data[entry].title;
		                var link = data[entry].link;
		              	var date = data[entry].date;

		              	$newItems += '<div class="tabpost">';

		              	if (data[entry].img) {
		              		$newItems +=
		              		'<div class="featuredimagewidget thumbnailarea">' +
							    '<a class="thumblink" href="' + data[entry].link + '">' +
									'<img src="'+ data[entry].img +'" />' +
							    '</a>' +
							'</div>';
		              	} else {
		              		$newItems +=
		              		'<div class="featurednoimagewidget">' +
								'<i class="fa fa-align-left"></i>' +
							'</div>'
		              	}

						$newItems +=
							'<p class="tab-title"><a href="' + data[entry].link + '" title="' +  data[entry].title + '">' +  data[entry].title + '</a></p>' +
							'<p class="views"><i class="fa fa-eye"></i> ' + data[entry].views + '</p>' +
							'<div class="clear"></div>' +
						'</div>';
					}
	   	        }

	        	$loading.fadeOut(100, function(){
	        		$content.html($newItems);
	        		$content.css('height', 'auto');
		            $content.stop().animate({'opacity' : '1'}, 250);
	        	});

	        },
	        error: function(MLHttpRequest, textStatus, errorThrown) {
	        console.log(errorThrown);
	        console.log(MLHttpRequest);
	        },
	        complete: function(XMLHttpRequest, textStatus) {
	         console.log(textStatus);
	        },
	        dataType: 'json'
	    });
	  });

	}

	/**
	 * Adds javascript hover effects
	 * @since v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.themewichHovers = function() {

		function hover_overlay_slides() {
			 jQuery('.featured-image a').each(function() {
				 var $this = jQuery(this).parent().find('img');
					jQuery(this).hover( function() {
						$this.stop().animate({opacity : 0.5}, 250, 'easeOutCubic');
					}, function() {
						$this.stop().animate({opacity : 1}, 250, 'easeOutCubic');
					});
			 });
		}

		function hover_overlay_isotope() {
			jQuery('.no-opacity a.postlink').each(function() {
				// Hover Function
				jQuery(this).hover(function() {
					jQuery(this).find('.overlay').stop().animate({'opacity' : 0.75}, 500, 'easeOutCubic');
				}, function() {
					jQuery(this).find('.overlay').stop().animate({'opacity' : 0}, 500, 'easeOutCubic');
				});
			});
		}

		hover_overlay_isotope();

		function hover_overlay_portfolio() {

			jQuery('a.thumblink').each(function() {
			  jQuery(this).closest('.featured-image').addClass('highlight').addClass('loaded').css({'min-height': '0'});
			});
		}

		function hide_loading() {
			jQuery('.featured-image').not('.isobrick .featured-image').css({'background': 'none', 'min-height': '0'});
		}

		(function($){ $(window).load(function() { hover_overlay_portfolio(); hover_overlay_images(); hide_loading(); }); })(jQuery);


		function hover_overlay_images() {

		 jQuery('a img').not('.single-slideshow a img, .featured-image img, .ag_recentprojects_widget a img, .featuredimagewidget a img, .gallery a img, a img.fullimg, a img.fixedimg').each(function() {
			jQuery(this).hover( function() {
				var $this = jQuery(this).parent().children('img');
				jQuery($this).stop().animate({opacity : 0.5}, 250, 'easeOutCubic');
			}, function() {
				var $this = jQuery(this).parent().children('img');
				jQuery($this).stop().animate({opacity : 1}, 250, 'easeOutCubic');
			});

		  });

		}

	}


	/**
	 * Responsive slider object
	 * @type {class}
	 */
	var themewichSlider = {

		createSlider : function(selector, callback) {

			jQuery(selector).each(function(index) {

				// Get Options from HTML
				var $this 			= jQuery(this),
					$info 			= $this.closest('.info'),
					$touch			= ($info.hasClass('postphoto')) ? false : true,
					$window 		= jQuery(window),
					autoPlay 		= $info.hasClass('autoplay') ? true : false,
					pauseDelay 		= 5000,
					custompager 	= $info.attr('data-pager') ? $info.attr('data-pager') : false,
					pauseDelay 		= $info.attr('data-pause') ? parseInt($info.attr('data-pause'), 10) : pauseDelay,
					pauseDelay 		= $info.hasClass('random') ? (Math.floor(Math.random()*10001) + 3000) : pauseDelay,
					speedDelay 		= $info.attr('data-speed') ? parseInt($info.attr('data-speed'), 10) : 500,
					pagerOption 	= $info.attr('data-pager') == 'false' ? false : true,
					pagerOption 	= $info.find('.bxslider li').length > 1 ? pagerOption : false,
					controls		= $info.hasClass('nocontrols') 	? false : true,
					customNext 		= $info.attr('data-next') ? $info.attr('data-next') : null,
					customPrev		= $info.attr('data-prev') ? $info.attr('data-prev') : null,
					carousel 		= $info.hasClass('carousel') ? true : false,
					moveSlides 		= $info.attr('data-moveslides') ? $info.attr('data-moveslides') : 0,
					autoHover 		= $info.hasClass('hovergo') ? false : true,
					homeslideshow 	= $info.hasClass('homeslideshow') ? true : false,
					slideWidth 		= $info.attr('data-width') ? $info.attr('data-width') : 320,
 					slideMode		= 'fade',
 					infiniteLoop 	= $info.attr('data-loop') ? $info.attr('data-loop') : false,
					slideMode 		= $info.hasClass('horizontal') ? 'horizontal' : slideMode,
					carouselMargin 	= $info.attr('data-space') ? $info.attr('data-space') : 0,
					slideMode 		= $info.hasClass('vertical') ? 'vertical' : slideMode,
					adaptive 		= $info.hasClass('noadapt') ? false : true;

				/**
				 * Carousel Slider
				 * @since v1.0
				 */
				function carouselSlider() {
					var slideMargin 	= 4,
						totalSlideWidth = slideWidth + slideMargin,
						noWide 			= $('body').hasClass('full-width');

				$this.bxSlider({
						//Options
						adaptiveHeight: adaptive,
						minSlides: 		1,
						maxSlides: 		9,
						moveSlides: 	moveSlides,
						auto: 			autoPlay,
						speed: 			speedDelay,
						pause: 			pauseDelay,
						autoHover: 		autoHover,
						infiniteLoop:   infiniteLoop,
						nextSelector: 	customNext,
						prevSelector:   customPrev,
						nextText: 		'<i class="fa fa-angle-right"></i>',
  						prevText: 		'<i class="fa fa-angle-left"></i>',
						slideWidth: 	slideWidth,
						slideMargin: 	slideMargin,
						pager: 			pagerOption,
						controls: 		controls,
						autoControls: 	false,
						useCSS: 		false, //Chrome gets buggy with this enabled
						touchEnabled: 	true,
						captions: 		false,
						preloadImages: 	'visible',

						//After Slider Load
						onSliderLoad: function() {

							// Closest info container
							$info = $this.closest('.info');

							// Fade in and add overlay effect
							$this.animate({'opacity': 1}, 500, 'easeOutCubic');

							// Fade In Controls
							$info.find('.bx-controls').animate({'opacity': 1}, 500);

							// Remove min-height and loading image
							$this
								.animate({'opacity': 1}, 500, function() {
									$this.closest('div.info')
										.css({
											'min-height': '100px',
											'background': 'none'
										});
								});

							// Fix popup issue with cloned slides
							var $clones 	= $this.find('.gallery-icon.bx-clone'),
								$noclones 	= $this.find('.gallery-icon').not('.gallery-icon.bx-clone');

								$clones.click(function(e) {
									var $clickedHref = $(this).find('a').attr('href');

									$noclones.each(function() {
										var $link = $(this).find('a');
										if ($link.attr('href') == $clickedHref) {
											$link.click();
										}
									});
									e.preventDefault();
								});

							// Callback Function
							if (callback && typeof(callback) === "function") {
								callback();
							}
						}
					});
				}


				/**
				 * Regular Slider
				 * @since v1.0
				 */
				function regularSlider() {

					function titleHeight() {
						var pager 			= $('.pagercontainer'),
							carouselHeight 	= pager.outerHeight(),
							slidetitle 		= pager.closest('.pagetitleloading').find('.slidecaption, .slidereview');

						slidetitle
							.css({
								'padding-bottom' : carouselHeight
							});
					}

					function burnsImage($slideElement, $oldIndex) {
						var el = $slideElement.find('img.kanimate');

						if (el) {
							var randx 		= 0 + Math.floor(Math.random() * 2),
								randy 		= 0 + Math.floor(Math.random() * 2),
								effect 		= 'kenburns'; //initial effect

							// Zoom in/out every other index
							if ( $oldIndex % 2 === 0 ) {
								effect = 'kenburns';
							} else {
								effect = 'kenburnsreverse';
							}

							// Random zoom coordinates
							randx = (randx != 0) ? '100' : randx + '';

							el
							.removeClass('kanimate kenburnsreverse kenburns') // remove previous classes
							.css({ // set transform origins
								'-webkit-transform-origin': randx + '% ' + '100%',
								'transform-origin' : randx + '% ' + '100%',
							});

							el.offsetWidth = el.offsetWidth; // needed to reset the animation

							// animate the element
							setTimeout(function () {
						        el.addClass(effect).addClass('kanimate');
						    }.bind(this), 10);

						}
					}

					function customPager(pagerCarousel, newIndex) {
						var viewportWidth 	= $('.homeslideshow.carousel .bx-viewport').width(),
							thumbWidth 		= $('.homeslideshow.carousel li').outerWidth(),
							visibleThumbs 	= (Math.floor(viewportWidth/thumbWidth)),
							factor			= newIndex / (visibleThumbs*(page+1));
							// factor2 		= oldIndex / (visibleThumbs-1*(page+1));

							if (factor % 1 == 0) {
								if (newIndex == 0) {
									page = 0; // Reset page
								} else {
									page++;
								}
							}

							$(window).resize(_.debounce(function(){
							    var viewportWidth 	= $('.homeslideshow.carousel .bx-viewport').width(),
									thumbWidth 		= $('.homeslideshow.carousel li').outerWidth(),
									visibleThumbs 	= (Math.floor(viewportWidth/thumbWidth));
							}, 250));

							if (newIndex < visibleThumbs) {
								pagerCarousel.goToSlide(0);
							}

							if ((newIndex >= visibleThumbs) && (newIndex < visibleThumbs*2)) {
								pagerCarousel.goToSlide(1);
							}

							if (newIndex >= visibleThumbs*2 && newIndex < visibleThumbs*3) {
								pagerCarousel.goToSlide(2);
							}

							if (newIndex >= visibleThumbs*3 && newIndex < visibleThumbs*4) {
								pagerCarousel.goToSlide(3);
							}

							if (newIndex >= visibleThumbs*4 && newIndex < visibleThumbs*5) {
								pagerCarousel.goToSlide(3);
							}

							if (newIndex >= visibleThumbs*5 && newIndex < visibleThumbs*6) {
								pagerCarousel.goToSlide(4);
							}
					}

					var page 			= 0,
						$pager 			= $this.closest('.pagetitleloading').find('.bx-slider-pager'),
						$pagerID		= $pager.attr('id'),
						pagerCarousel 	= $pager.bxSlider({
											minSlides: 2,
											maxSlides: 4,
											slideWidth: 270,
											slideMargin: 10,
											infiniteLoop: false,
											hideControlOnEnd: true,
											useCSS: 		false, //Chrome gets buggy with this enabled
											pager: false,
											//After Slider Load
											onSliderLoad: function() {
												titleHeight();
											}
										});

					$this.bxSlider({
							// Options
							adaptiveHeight: adaptive,
							mode: 			slideMode,
							auto: 			autoPlay,
							speed: 			speedDelay,
							pause: 			pauseDelay,
							pager: 			pagerOption,
							pagerCustom:	custompager,
							touchEnabled: 	$touch,
							autoHover:  	autoHover,
							controls: 		controls,
							captions: 		false,
							responsive: 	true,
							preloadImages: 'visible',
							onSlideBefore: function($slideElement, oldIndex, newIndex){
								titleHeight(); 				// Set the title height
								burnsImage($slideElement, oldIndex); 	// Set the kenburns animation effect

								if(homeslideshow) {
									customPager(pagerCarousel, newIndex); // Set custom pager
								}
							},
							onSliderLoad: function(currentIndex) {

								titleHeight();

								$(window).focus(function() {
									customPager(pagerCarousel, currentIndex); // Set custom pager
								});

								var doit1;
								window.onresize = function(){
									titleHeight();
								};

								// Closest info container
								$info = $this.closest('.info');

								//$this.closest('.pagetitleloading').css('min-height', 0);

								// Fade In Controls
								$info.find('.bx-controls').animate({'opacity': 1}, 500);

								// Remove min-height and loading image
								$this
									.animate({'opacity': 1}, 500, function() {
										$this.closest('div.info')
											.css({
												'min-height': '100px',
												'background': 'none'
											});
									});

								if (callback && typeof(callback) === "function") {
									callback();
								}
							}
						});

				}


				/**
				 * Centers the slide text vertically
				 * @param  {selector} $info Selector for the slide options
				 * @return {void}
				 */
				function centerTextSlide($info) {
					if ($info.hasClass('titlerotator') && $info.hasClass('noadapt')) {
						var $maxheight = $this.closest('.pagetitle').height();
						$this.children('li').each(function() {
							var $originalHeight = $(this).height();
							$(this).css('padding-top', ($maxheight-$originalHeight)/2);
						});
					}
				}


				/**
				 * Slider initialization
				 */
				if (carousel) {
					carouselSlider();
				} else {
					regularSlider();
				}

			});
		}
	}


	/**
	 * jQuery Isotope Class
	 * @since  v1.0
	 */
	if(jQuery().isotope) {

		var themewichIsotope = {

			/**
			 * Regular fixed-column isotope
			 * @param  {string}   selector Container selector
			 * @param  {Function} callback Callback function
			 * @since v1.0
			 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
			 */
			loadIsotope : function(selector, callback) {

				jQuery(selector).each(function() {

					var $this 			= $(this),
						columnNumber 	= $this.attr('data-value'),
						isoBrick 		= $('.isobrick'),
						$body 			= $('body'),
						$colnum2;

					// Remove margins
					isoBrick.css({
						'margin-left': 0,
						'margin-right': 0
					});

			        /**
					* Get column number
					*/
			  		function findColNum() {
						// Get column number
						if ($this.width() < 700 ) {
							$colnum2 = 2;
						} else {
							$colnum2 = columnNumber;
						}
					}

					/**
					 * Sets dynamic size of isotope brick
					 * @var brick selector
					 */
					function setBrickSize($isobrick) {

						var columnWidth = $this.width() / $colnum2

						// Set width of each brick
						$isobrick.not('.isobrick.noimages').each(function() {
							var $brick 		= $(this),
								$brickphoto = $brick.find('.postphoto');

							if ($brick.hasClass('big')) {
								$brickphoto.css({
									'min-height' : (((columnWidth*2)-4) * 0.7566) + 'px'
								});
							} else if ($brick.hasClass('slim')) {
								$brickphoto.css( {
									'min-height' : ((columnWidth-4) * 0.5) + 'px'
								});
							} else {
								$brickphoto.css( {
									'min-height' : ((columnWidth-4) * 1.01063) + 'px'
								});
							}

						});
					}

					/**
					* Run isotope plugin
					*/
					function callIsotope() {
						// Call isotope with selected columns
						if (columnNumber != '1') {
						  $this.isotope({
						  masonry: {
							  columnWidth: $this.width() / $colnum2
							},
							itemSelector : '.isobrick',
							layoutMode : 'masonry'
						  }, function() {
						  });
						}
					}

					/**
					* Call isotope functions in correct order
					*/
					function runIsotope() {

						// Call Functions
						findColNum();
						setBrickSize($this.find('.isobrick'));
						callIsotope();

						// In case it fires too soon due to css3 animations
						$this.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function() {
							if ($this.hasClass('isotope')) {
								$this.isotope('reLayout');
							}
						});
					}


					/**
					* Run Isotope on load
					*/
					runIsotope();

					/**
					* Run Isotope on Resize Event
					*/
					$(window).resize(_.debounce(function(){
					    runIsotope();
					}, 250));


					/**
					 * Run isotope after images load
					 */
					$(window).load(function(){
						runIsotope();
					})


					/**
					* Filter link when clicked
					* @return false
					*/
					$('#filters a, a.filtersort').click(function() {
						$('#filters a').removeClass("active");

						  var $selector = $(this).attr('data-filter');

							  $('#filters a').each(function() {
								  var $filterselect = $(this).attr('data-filter');
								  if ($filterselect == $selector){
									$(this).addClass("active");
								  }
							  });

						  $this.isotope({ filter: $selector });
						  return false;
					});

					// Callback
					if (callback && typeof(callback) === "function") {
							callback();
					}

				}); // End Each

			}
		}
	}

	/**
	 * Scroll to top function
	 * @param  {string} selector Top selector
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.scrollToTop = function() {

		var selector 			= this,
			scroll_pos_test 	= 50;

	  $(window).scroll(function () {

		var y_scroll_pos 		= window.pageYOffset,
			windowWidth 		= $(window).width();

		if(y_scroll_pos > scroll_pos_test && windowWidth >= 1130) {
			$(selector).fadeIn(500);
			$('.iphone').children(selector).css('display', 'none !important');
		} else {
			$(selector).fadeOut(500);
		}

		});

		$(selector).click(function(e){
				$('html, body').animate({scrollTop:0}, 500, 'easeOutCubic');
				e.preventDefault();
				return false;
		});

	}

	/**
	 * Hover Helper
	 * @param  {string} selector Top selector
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.themewichHoverHelper = function() {
		var $this 			= $(this),
			$hoverHelper 	= $('p.hoverhelper').css('opacity', 0).empty();

		$this.each(function() {
			$(this).hover( function() {
				var $hovertext = $(this).text();
				$hoverHelper.stop().animate({opacity : 0}, 500, 'easeOutCubic', function() {
					$hoverHelper.empty().text($hovertext).stop().animate({opacity : 1}, 500, 'easeOutCubic');
				});

			}, function() {
				$hoverHelper.stop().animate({opacity : 0}, 500, 'easeOutCubic');
			});
		});
	}

	/**
	 * Video Wrap Helper
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.addVideoWrap = function() {
		$('.fluid-width-video-wrapper').wrap('<div class="fixed">');
	}

	/**
	 * Height Helper
	 * @param  {string} selector element selector
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.heightHelper = function() {
		var h 		= '';
		$(this).each(function() {
			var $this 	= $(this),
				w 		= $(this).width();
			if ($this.closest('.isobrick').hasClass('big')) {
				h = w * 0.7566;
			} else if ($this.hasClass('slim')) {
				h = w * 0.5;
			} else {
				h = w * 1.01063;
			}
			$this.css({'min-height' : h+'px'}).attr('data-height', h);
		});
	}

	/**
	 * Love It Button
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.themewichLove = function() {

		var postlike = $(this);

		// Prevent default
		postlike.click(function(e){
			e.preventDefault();
		});

		// Only run once per page load
		postlike.one('click', function(e){

			e.preventDefault();

			var heart 	= $(this),
				post_id = heart.data("post_id"),
				counter = heart.find(".count"),
				title 	= heart.find('.sharetitle'),
				clicked = title.attr('data-clicked');

				// Add bouncing animation
				counter.addClass('bounceinfinite');

				jQuery.ajax({
					type: "post",
					url: agAjax.ajaxurl,
					data: "action=post-like&nonce="+agAjax.nonce+"&post_like=&post_id="+post_id,
					success: function(count){
						if(count != "already")
						{
						    counter.removeClass('bounceinfinite');
						    title.html(clicked);
							heart.addClass("voted");
							counter.text(count);
						}
					}
				});

			return false;
		});
	}

	/**
	 * Shares Counter
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.themewichShareCount = function() {

		var shareLink = $(this),
			shareButton = $('.sharing a.share');

		// Only run once per page load
		shareLink.on('click', function(e){

			var post_id 		= shareButton.data("post_id"),
				shareCounter 	= shareButton.find(".count"),
				title 			= shareButton.find('.sharetitle'),
				clicked 		= title.attr('data-clicked');

				// Add bouncing animation
				shareCounter.addClass('bounceinfinite');

				jQuery.ajax({
					type: "post",
					url: agAjax.ajaxurl,
					data: "action=post-share&nonce="+agAjax.nonce+"&post_share=&post_id="+post_id,
					success: function(count){
						    shareCounter.removeClass('bounceinfinite');
						    title.html(clicked);
							shareButton.addClass("shared");
							shareCounter.text(count);
					}
				});

		});
	}

	/**
	 * Make images fade in when into view
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.scollIntoView = function() {

		$(this).addClass('disappear');

		$(this).one('inview', function() {
			$(this).addClass('appear');
		});

		function getViewportHeight() {
	        var height = window.innerHeight; // Safari, Opera
	        var mode = document.compatMode;

	        if ( (mode || !$.support.boxModel) ) { // IE, Gecko
	            height = (mode == 'CSS1Compat') ?
	            document.documentElement.clientHeight : // Standards
	            document.body.clientHeight; // Quirks
	        }

	        return height;
	    }

	    $(window).scroll(function () {
	        var vpH = getViewportHeight(),
	            scrolltop = (document.documentElement.scrollTop ?
	                document.documentElement.scrollTop :
	                document.body.scrollTop),
	            elems = [];

	        // naughty, but this is how it knows which elements to check for
	        $.each($.cache, function () {
	            if (this.events && this.events.inview) {
	                elems.push(this.handle.elem);
	            }
	        });

	        if (elems.length) {
	            $(elems).each(function () {
	                var $el = $(this),
	                    top = $el.offset().top,
	                    height = $el.height(),
	                    inview = $el.data('inview') || false;

	                if (scrolltop > (top + height) || scrolltop + vpH < top) {
	                    if (inview) {
	                        $el.data('inview', false);
	                        $el.trigger('inview', [ false ]);
	                    }
	                } else if (scrolltop < (top + height)) {
	                    if (!inview) {
	                        $el.data('inview', true);
	                        $el.trigger('inview', [ true ]);
	                    }
	                }
	            });
	        }
	    });

	    // kick the event to pick up any elements already in view.
	    // note however, this only works if the plugin is included after the elements are bound to 'inview'

    	$(window).scroll();

	}

	$.fn.parallaxScroll = function() {
		var windowVar = $(window);

	    $(this).each(function(){
	        var $bgobj = $(this); // assigning the object

	        windowVar.scroll(function() {
	            var yPos = (windowVar.scrollTop() / 4);

	            // Put together our final background position
	            var coords = yPos + 'px';

	            // Move the background
	            $bgobj.css({ 'margin-top' : coords });
	        });
	    });
	}

	$.fn.smoothScroll = function() {
		// SmoothScroll v0.9.9
		// Licensed under the terms of the MIT license.

		// People involved
		// - Balazs Galambosi: maintainer (CHANGELOG.txt)
		// - Patrick Brunner (patrickb1991@gmail.com)
		// - Michael Herf: ssc_pulse Algorithm
			function k() { if (document.body) { var a = document.body, b = document.documentElement, c = window.innerHeight, d = a.scrollHeight; m = 0 <= document.compatMode.indexOf("CSS") ? b : a; p = a; r = !0; top != self ? s = !0 : d > c && (a.offsetHeight <= c || b.offsetHeight <= c) && (m.style.height = "auto", m.offsetHeight <= c && (c = document.createElement("div"), c.style.clear = "both", a.appendChild(c))); t || (a.style.backgroundAttachment = "scroll", b.style.backgroundAttachment = "scroll"); v && window.addEventListener("keydown", w, !1) } }
			function x(a, b, c) {
			    var d; d || (d = 1E3); y(b, c); z.push({ x: b, y: c, a: 0 > b ? 0.99 : -0.99, b: 0 > c ? 0.99 : -0.99, start: +new Date }); if (!A) {
			        var e = function () {
			            for (var u = +new Date, l = 0, q = 0, n = 0; n < z.length; n++) { var f = z[n], g = u - f.start, C = g >= B, h = C ? 1 : g / B; D && (g = h, 1 <= g ? h = 1 : 0 >= g ? h = 0 : (1 == E && (E /= F(1)), h = F(g))); g = f.x * h - f.a >> 0; h = f.y * h - f.b >> 0; l += g; q += h; f.a += g; f.b += h; C && (z.splice(n, 1), n--) } b && (u = a.scrollLeft, a.scrollLeft += l, l && a.scrollLeft === u && (b = 0)); c && (l = a.scrollTop, a.scrollTop += q, q && a.scrollTop === l && (c = 0)); b || c || (z = []); z.length ? setTimeout(e,
			            d / G + 1) : A = !1
			        }; setTimeout(e, 0); A = !0
			    }
			} function H(a) { r || k(); var b = a.target, c = I(b); if (!c || a.defaultPrevented || "embed" === p.nodeName.toLowerCase() || "embed" === b.nodeName.toLowerCase() && /\.pdf/i.test(b.src)) return !0; var b = a.wheelDeltaX || 0, d = a.wheelDeltaY || 0; b || d || (d = a.wheelDelta || 0); 1.2 < Math.abs(b) && (b *= J / 120); 1.2 < Math.abs(d) && (d *= J / 120); x(c, -b, -d); a.preventDefault() }
			function w(a) {
			    var b = a.target, c = a.ctrlKey || a.altKey || a.metaKey; if (/input|textarea|embed/i.test(b.nodeName) || b.isContentEditable || a.defaultPrevented || c || "button" === b.nodeName.toLowerCase() && a.keyCode === K) return !0; var d; d = b = 0; var c = I(p), e = c.clientHeight; c == document.body && (e = window.innerHeight); switch (a.keyCode) {
			        case L: d = -M; break; case N: d = M; break; case K: d = a.shiftKey ? 1 : -1; d = -d * e * 0.9; break; case O: d = 0.9 * -e; break; case P: d = 0.9 * e; break; case Q: d = -c.scrollTop; break; case R: e = c.scrollHeight - c.scrollTop - e; d = 0 < e ?
			        e + 10 : 0; break; case S: b = -M; break; case T: b = M; break; default: return !0
			    } x(c, b, d); a.preventDefault()
			} function U(a) { p = a.target } function V(a, b) { for (var c = a.length; c--;) W[X(a[c])] = b; return b }
			function I(a) { var b = [], c = m.scrollHeight, overflow = 'auto'; do { var d = W[X(a)]; if (d) return V(b, d); b.push(a); if (c === a.scrollHeight) { if (!s || m.clientHeight + 10 < c) return V(b, document.body) } else if (a.clientHeight + 10 < a.scrollHeight && (overflow = getComputedStyle(a, "").getPropertyValue("overflow"), "scroll" === overflow || "auto" === overflow)) return V(b, a) } while (a = a.parentNode) } function y(a, b) { a = 0 < a ? 1 : -1; b = 0 < b ? 1 : -1; if (Y !== a || Z !== b) Y = a, Z = b, z = [] }
			function F(a) { var b; a *= $; 1 > a ? b = a - (1 - Math.exp(-a)) : (b = Math.exp(-1), a = 1 - Math.exp(-(a - 1)), b += a * (1 - b)); return b * E } var G = 150, B = 500, J = 150, D = !0, $ = 6, E = 1, v = !0, M = 50, s = !1, Y = 0, Z = 0, r = !1, t = !0, m = document.documentElement, p, S = 37, L = 38, T = 39, N = 40, K = 32, O = 33, P = 34, R = 35, Q = 36, z = [], A = !1, W = {}; setInterval(function () { W = {} }, 1E4); var X = function () { var a = 0; return function (b) { return b.c || (b.c = a++) } }();
			/chrome/.test(navigator.userAgent.toLowerCase()) && (window.addEventListener("mousedown", U, !1), window.addEventListener("mousewheel", H, !1), window.addEventListener("load", k, !1));
	}

	/**
	 * Home Ajax
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.themewichPaginationAjax = function() {

		function progressiveAnimate(items, reverse) {
			var i = 0;

			if (reverse) {
				items = $(items.get().reverse());
			}

			items.each(function(){
				var $this = $(this);

				if (reverse) {
					$this.stop().delay( i + '').fadeTo(150, 0);
				} else {
					$this.stop().delay( i + '').fadeTo(150, 1);
				}

				i = i + 100;
			});
		}

		$(this).on('click', '.pagination a', function(e){
            e.preventDefault(); // prevent default linking

            var $this      		= $(this), 							// store this
                link        	= $this.attr('href'), 				// link url
                $viewport   	= $('html, body'), 					// to scroll viewport
                $pcontainer 	= $this.closest('.grid-wrapper, .regularwrapper'), // container to load
                postcontainer 	= $pcontainer.attr("id"), 			// specific container id
                $grid 			= $this.closest('.imagegrid, .regulargrid'), 		// grid wrapper
                $bricks 		= $pcontainer.find('.isobrick'), 	// individual bricks to fade
                $loader     	= $grid.find('.loading'), 			// loading animation
                $controls   	= $grid.find('.pagination'); 		// controls

                //////////////////////////
                // Animate the viewport //
                //////////////////////////
                $viewport
                	.animate({ scrollTop: $grid.offset().top - 40 }, 1700, "easeOutQuint")
                	.bind("scroll mousedown DOMMouseScroll mousewheel keyup", function (e) {
                        if (e.which > 0 || e.type === "mousedown" || e.type === "mousewheel") {
                            $viewport.stop()
                            // This identifies the scroll as a user action, stops the animation, then unbinds the event straight after
                            .unbind('scroll mousedown DOMMouseScroll mousewheel keyup');
                        }
                	});

                // Swap Controls for Loading Animation
                $loader.stop().delay(500).fadeIn(500);
                $controls.fadeOut(500);

                // Fade out the bricks
                progressiveAnimate($bricks, true);

                ///////////////////////
            	// Load new content //
                ///////////////////////
            	$pcontainer.load(link + ' #' + postcontainer + ' .homeposts', function(responseTxt,statusTxt,xhr) {
				    if(statusTxt=="success") {
				    	var $this 		= $(this),
				    		$controls   = $this.find('.pageflip, .pagination'),
                        	$bricks 	= $this.find('.isobrick');

                        // Hide controls and bricks at start
                        $controls.hide();

                        $bricks.css('opacity', 0);

                        // animate bricks
                        $this.imagesLoaded( function() {

                            // Run isotope
                            themewichIsotope.loadIsotope('.isotopecontainer');

                            progressiveAnimate($bricks, false);

                            // Change top controls to pager
                            $loader.stop().fadeOut(100, function(){
                               $controls.stop().fadeIn(500);
                               $pcontainer.find('.homeposts').themewichPaginationAjax(); // add ajax event only to loaded content
                            });
                        });
				    }

			      	// Error loggins
				    if(statusTxt=="error") {
				    	console.log("Error: "+xhr.status+": "+xhr.statusText);
				    }

			  });

        });
	}

	/**
	 * Backstretch Functionality
	 * @since  v1.0
	 * (c) Copyright 2013 Andre Gagnon - http://themewich.com
	 */
	$.fn.themewichBackStretch = function(container) {
		if ($.fn.backstretch) {
			$(this).each(function(){
				var $this 		= $(this),
					$url 		= $this.attr('src'), 	// Image
					$container 	= $this.closest(container); 		// Container

				$this.remove();
				if ($url.length) {
					$container.backstretch($url, { fade: 500 });
				}
			});
		}
	}

	$.fn.themewichSticky = function() {

		/**
		 * Run sticky nav script if enabled
		 */
		if ($('body').hasClass('sticky-nav-enabled')) {
			var sticky_nav 		= $('.regular-nav .top-nav'), // regular nav selector
				alt_sticky_nav 	= $('.altnav .top-nav.altnav'), // alt nav selector
				mobilelink 		= $('.mobile-link'),
				useSticky 		= $('body').hasClass('safari') ? false : true; // mobile link

			// Regular sticky nav
			sticky_nav.fixTo('body', {
			    className : 'mm-fixed-top is_stuck',
			    mind : '#wpadminbar', // mind the top nav
			    useNativeSticky: false,  // turn off due to safari, firefox issues
			    zIndex : 199
			});

			/**
			 * Regular sticky navigation
			 */
			if (!sticky_nav.hasClass('stickyloaded')  && sticky_nav.length) {

				// Add loaded indicator
				sticky_nav.addClass('stickyloaded');
				$(window).resize(function(){
					sticky_nav.css({
						'height' : 'auto'
					});
					sticky_nav.fixTo('refresh');
				});
			}

			/**
			 * Alternate sticky navigation
			 */
			if (!alt_sticky_nav.hasClass('stickyloaded') && alt_sticky_nav.length) {
				var $altcontainer = $('.altcontainer');
				$altcontainer.addClass('stickyloaded');
				$altcontainer.fixTo('body', {
				    className : 'mm-fixed-top is_stuck',
				    mind : '#wpadminbar', // mind the admin bar
				    useNativeSticky: false,  // turn off due to safari, firefox issues
				    zIndex : 199
				});
			}
		}

	}

	$.fn.themewichStickySocial = function() {

		// Change mind if mobile
		function mindmobile() {
			if (mobilelink.is(':visible')) {
				social.fixTo('setOptions', {
				    mind :  '#wpadminbar'
				});
			} else {
				social.fixTo('setOptions', {
				    mind : '.top-nav.regular-nav.stickyloaded, .altcontainer.stickyloaded, #wpadminbar' // mind the top nav
				});
			}
		}

		var social 			= $(this), // sticky icons
			mobilelink 		= $('.mobile-link'),
			useSticky 		= $('body').hasClass('safari') ? false : true; // mobile link; // if it's a mobile layout

		social.fixTo('.rightside', {
		    className : 'is_stuck',
		    useNativeSticky: false,  // turn off due to safari, firefox issues
		    top: 5
		});

		mindmobile(); // set mind parameters
		$(window).resize(_.debounce(function(){
		    mindmobile(); // reset on resize
		}, 250));

	}

	$.fn.menuAddition = function(searchform) {
		var mobileSearch = $(this),
			mobileSearchWrap = mobileSearch.closest('.mm-search'),
			desktopSearch = $(searchform),
			searchAction = desktopSearch.find('form').attr('action'),
			searchButton = desktopSearch.find('i').clone();

		// wrap search functionality
		mobileSearch.wrap('<form method="get" action="' + searchAction + '" class="mobilesearch"></form>').attr('name', 's');

		// add search button
		mobileSearchWrap.append(searchButton[0]);

		// run
		mobileSearchWrap.searchSubmit();
	}

	/**
	 * Initialize all scripts here
	 *
	 * Comment out script lines to remove functionality
	 */
	$.fn.themewichScripts = function() {

		// Run theme plugins
		if ($.fn.magnificPopup) {
			$('body').themewichLightbox();
		}
		if ($.fn.fitVids) {
			$('body').fitVids();
		}

        $("#mobilemenu").mmenu({
            extensions: ["theme-dark"],
            classes:     "mm-slide",
            offCanvas:   {
                position: "right"
            },
            clone:       true,
            searchfield: {
                add:    true,
                search: false
            }
        }, {
            pageSelector: ".mm-page" // use a custom static html div
        });

	   // create site search functionality
       $('.mm-search input').menuAddition('.search-form');

		if ($.fn.superfish) {
			$('ul.sf-menu').not('ul.sf-menu#jPanelMenu-menu').superfish({ cssArrows: true });
		}
		if ($.fn.validate) {
			$("#contactform").validate();
			$("#quickform").validate();
			$("#commentsubmit").validate();
		}
		if ($.fn.bxSlider && $('ul.bxslider').length) {
			$(window).load(function(){
				themewichSlider.createSlider('ul.bxslider');
			});
		}
		if ($.fn.isotope) {
			if ($('.isotopecontainer').length) {
				themewichIsotope.loadIsotope('.isotopecontainer');
			}
		}

		// Run the theme-specific functions
		$('.backgroundsize img.parallaximg').parallaxImg();
		$('body').themewichSticky();
		$('.sharingwrap.desktop-share').themewichStickySocial();

		$('.imagecover img').themewichBackStretch('.imagewrapper');

		if ( ! $('body').hasClass('osx') ) { // disable for mac
			$('body').smoothScroll();
		}
		//$('.imagecover .full-bg-image').parallaxBGScroll();
		$('.full-image .backstretch img').parallaxScroll();
		$('.ajax-tabs a').ajaxLoadPosts();
		$('.search-form').searchSubmit();
		$('a.post-like').themewichLove();
		$('#share-box a').themewichShareCount();
		$('body').addVideoWrap();
		$('.top').scrollToTop();
		$('body').themewichHovers();
		$('.controls a').themewichHoverHelper();
		$('.homeposts').themewichPaginationAjax();
	}

	$(document).ready(function() {
		$('body').themewichScripts();
	});

})(jQuery);