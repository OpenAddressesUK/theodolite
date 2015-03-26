
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

	window.onscroll = function(e) {
			homeGFX.style.transform = 'translate3d(0px,' + Math.round(window.scrollY/6) + 'px, 0px)';
	}

});