
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

});