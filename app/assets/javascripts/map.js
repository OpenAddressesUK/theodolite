$(document).ready(function () {

	L.mapbox.accessToken = 'pk.eyJ1Ijoib3BlbmFkZHJlc3NlcyIsImEiOiJ6NG5zdy1jIn0.3geJ_DPjwkm0iTLlV0CA3g';
	var map = L.mapbox.map('map', 'openaddresses.k75i6o4d');
	var oaIcon = L.icon({
    	iconUrl: '/images/mapicon.png',
    	iconSize: [35, 35],
    	iconAnchor: [33, 35],
    	popupAnchor: [0, 35]
	});

	var locations = [];

	$('*[data-postcode]').each(function () {
		var $address = $(this);
		var postcode = $address.attr('data-postcode').replace(/ /, '');
		$.getJSON('http://uk-postcodes.com/postcode/' + postcode + '.json', function (data) {
			var geo = data.geo;
			var lat = geo.lat;
			var long = geo.lng;
			if (!(lat === undefined || long === undefined)) {
				var marker = L.marker([lat, long], { icon: oaIcon, riseOnHover: true }).addTo(map);
				locations.push([lat, long]);
				map.fitBounds(L.latLngBounds(locations));
			}
		});
	});

});
