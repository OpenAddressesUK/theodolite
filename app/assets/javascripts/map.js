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

	$('*[data-latlng]').each(function () {
		var latlng = $(this).attr('data-latlng').split(",");
		var lat = latlng[0];
		var long = latlng[1];
		var marker = L.marker([lat, long], { icon: oaIcon, riseOnHover: true }).addTo(map);
		locations.push([lat, long]);
		map.fitBounds(L.latLngBounds(locations));
	});

});
