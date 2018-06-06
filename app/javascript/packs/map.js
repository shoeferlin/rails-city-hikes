import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const route = document.getElementById('data-edit');
if (route) {
  const routeData = route.dataset;
}

function buildMap()  {
  const mapElement = document.getElementById('map');
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.waypoints);
    console.log(markers)
    const waypoints = markers.map((point) => {
      const lnglat = new google.maps.LatLng(point)
      return({
       location: lnglat,
       stopover: true,
       // optimize: true,
      })
    })

    // console.log(waypoints

    // markers[0].fillColor = 'blue';

    // console.log(markers)
    map.addMarkers(markers);
    map.drawRoute({
      origin: [markers[0].lat, markers[0].lng],
      destination: [markers[markers.length - 1].lat, markers[markers.length - 1].lng],
      waypoints: waypoints,
      travelMode: 'walking',
      strokeColor: '#8aae92',
      strokeOpacity: '0.8',
      strokeWeight: '6',
    });

    map.getRoutes({
        origin: [markers[0].lat, markers[0].lng],
        destination: [markers[markers.length - 1].lat, markers[markers.length - 1].lng],
        callback: function (e) {
            // console.log(e)
            // console.log(e[0].legs.length)
            var time = 0;
            var distance = 0;
            for (var i=0; i<e[0].legs.length; i++) {
                time += e[0].legs[i].duration.value;
                distance += e[0].legs[i].distance.value;
            }
            // alert((time/60).toFixed(2) + " min" + ", " + (distance/60).toFixed(2) +" km");
            updateRouteDetails((time/60).toFixed(2), (distance/1000).toFixed(2))

            Rails.ajax({
              url: `/routes/${routeData.id}`,
              type: "PATCH",
              // data: `list_nr:${itemNewIndex}`,
              data: String(`time=${(time/60).toFixed(0)}`) + "&" + String(`distance=${(distance/1000).toFixed(2)}`),
              success: function(data) {
                document.getElementById("map").dataset.waypoints = JSON.stringify(data);
                buildMap();
              }
            });
        }
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

}

function updateRouteDetails(time, distance) {

  var hours = parseInt(time/60)
  var minutes = parseInt(time % 60)
  const routeTime = document.querySelector("#routetime > p")
  const routeDistance = document.querySelector("#routedistance > p")

  if (routeTime && routeDistance) {
    routeTime.innerHTML = `<p>Duration: ${hours}h ${minutes}min</p>`
    routeDistance.innerHTML = `<p>Distance: ${distance} km</p>`
  }
}

updateRouteDetails();


buildMap();
// if (!route) {

// }

export default buildMap;
