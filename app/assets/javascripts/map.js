$(document).ready(function () {

	L.mapbox.accessToken = 'pk.eyJ1Ijoib3BlbmFkZHJlc3NlcyIsImEiOiJ6NG5zdy1jIn0.3geJ_DPjwkm0iTLlV0CA3g';
	var map = L.mapbox.map('map', 'openaddresses.k75i6o4d');

	var locations = [];

	$('*[data-postcode]').each(function () {
		var postcode = $(this).attr('data-postcode').replace(/ /, '');
		$.getJSON('http://uk-postcodes.com/postcode/' + postcode + '.json?nocache=' + new Date(), function (data) {
			console.log(postcode);
			console.log(data);
		});
	});

});
