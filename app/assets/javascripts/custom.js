
/* Custom JS */

$(function() {
	$("body").click( function (e) {
		$(".navigation > ul > li > ul").hide();
	})
	$(".navigation > ul > li:has(ul) > a").click( function (e) {
		$(".navigation > ul > li > ul").hide();
		$(this).parent().find("> ul").show();
		e.preventDefault();
		e.stopPropagation();
	})

	var homeGFX = $('.home-gfx')[0];;
	if (homeGFX) {
		window.onscroll = function(e) {
			homeGFX.style.transform = 'translate3d(0px,' + Math.round(window.scrollY/6) + 'px, 0px)';
			homeGFX.style.style.webkitTransform = 'translate3d(0px,' + Math.round(window.scrollY/6) + 'px, 0px)';
		}
	}

	$(".content .scenario").nextAll().wrapAll("<div class='content content-below-scenario'></div>");
	$(".content-below-scenario").wrapAll("<div class='container container-below-scenario'></div>");
	var afterStuff = $(".container-below-scenario").detach();
	var scenarioStuff = $(".content .scenario").wrapInner( "<div class='container'></div>").detach();

	$(".container-content").after(scenarioStuff);
	$(".scenario").after(afterStuff);

	var shareStuff = $(".share-links").detach();
	$( ".container-below-scenario" ).append(shareStuff );



	var contentHeroStuff = $(".content-hero").wrapInner( "<div class='container'></div>").detach();
	$(".container-content").before(contentHeroStuff);

	
});