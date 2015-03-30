
/* Custom JS */

$(function() {

	$("body").click( function (e) {
		$(".nav-desktop > li > ul").hide();
	})
	$(".nav-desktop > li:has(ul) > a").click( function (e) {
		$(".nav-desktop > li > ul").hide();
		$(this).parent().find("> ul").show();
		e.preventDefault();
		e.stopPropagation();
	})


	/* Setup Mobile menu */

	var menuOpen = false;
	$(".hamburger").click( function (e) {
		if (menuOpen) {
			menuOpen = false;
			$(".nav-mobile").removeClass("is-visible");
			$("body").removeClass("has-mobile-menu-open");
		}
		else {
			menuOpen = true;
			$(".nav-mobile").addClass("is-visible");
			$("body").addClass("has-mobile-menu-open");
		}
	})

	$(".nav-mobile > li:has(ul)").addClass("has-children");

	$(".nav-mobile .has-children > a").append("<div class='sub-menu-action sub-menu-action-open'>+</div>");
	$(".nav-mobile .has-children > a").append("<div class='sub-menu-action sub-menu-action-close'>-</div>");

	$('.nav-mobile > li:has(ul) > a').click(function(e){
		if($(this).parent().hasClass('is-showing-children')){
			$(this).parent().removeClass("is-showing-children");
			$(this).parent().find("> ul").hide();
		} else {
			$(this).parent().addClass("is-showing-children");
			$(this).parent().find("> ul").show();
		}
		e.preventDefault();
	});

/*
 $('.open-menu-link').click(function(e){
	        var childMenu =  e.currentTarget.parentNode.children[1];
	        if($(childMenu).hasClass('visible')){
	            $(childMenu).removeClass("visible");
	
	            $(e.currentTarget.parentNode.children[3]).removeClass("visible");
	            $(e.currentTarget.parentNode.children[2]).addClass("visible");
	        } else {
	            $(childMenu).addClass("visible");
	
	            $(e.currentTarget.parentNode.children[2]).removeClass("visible");
	            $(e.currentTarget.parentNode.children[3]).addClass("visible");
	        }
	    });

*/

var homeGFX = $('.home-gfx')[0];
if (homeGFX) {
	window.onscroll = function(e) {
        var offsetY = (window.scrollY ? window.scrollY : window.pageYOffset)/6;
		homeGFX.style.transform = 'translate3d(0px,' + Math.round(offsetY) + 'px, 0px)';
		homeGFX.style.webkitTransform = 'translate3d(0px,' + Math.round(offsetY) + 'px, 0px)';
        homeGFX.style.mozTransform = 'translate3d(0px,' + Math.round(offsetY) + 'px, 0px)';
        homeGFX.style.msTransform  = 'translate3d(0px,' + Math.round(offsetY) + 'px, 0px)';
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


$(".address-search-address-submit-cta").click(function() {
	$(".address-search-address-submit-form").show();
});

});