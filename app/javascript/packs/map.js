import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.waypoints);
  const waypoints = markers.map((point) => {
    const lnglat = new google.maps.LatLng(point)
    return({
     location: lnglat,
     stopover: true
    })
  })

  var options = {
      fillColor: 'red',
      title: 'Johnnys Marker'
    };

  markers[0].color = 'blue';

  console.log(markers[0])
  map.addMarkers(markers, options);
  map.drawRoute({
    origin: [markers[0].lat, markers[0].lng],
    destination: [markers[markers.length - 1].lat, markers[markers.length - 1].lng],
    waypoints: waypoints,
    travelMode: 'walking',
    strokeColor: '#8aae92',
    strokeOpacity: '0.8',
    strokeWeight: '6',
  });

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}


