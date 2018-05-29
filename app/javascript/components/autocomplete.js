// JavaScript AutoComplete for Geocoding
import GMaps from 'gmaps/gmaps.js';

function autocomplete() {
  // console.log("JS autocomplete active")
  // document.addEventListener("DOMContentLoaded", function() {
  //   var userAddress = document.getElementById('city_name');

  //   if (userAddress) {
  //     var autocomplete = new google.maps.places.Autocomplete(userAddress, { types: [ 'geocode' ] });
  //     google.maps.event.addDomListener(userAddress, 'keydown', function(e) {
  //       if (e.key === "Enter") {
  //         e.preventDefault(); // Do not submit the form on Enter.
  //       }
  //     });
  //   }
  // });

  function initializeAutocomplete(id) {
    var element = document.getElementById(id);
    if (element) {
      var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    }
  }

  function onPlaceChanged() {
    var place = this.getPlace();

    // debugger
    // console.log(place);  // Uncomment this line to view the full object returned by Google API.

    for (var i in place.address_components) {
      var component = place.address_components[i];
      for (var j in component.types) {  // Some types are ["country", "political"]
        var type_element = document.getElementById("city_" + component.types[j]);
        if (type_element) {
          type_element.value = component.short_name;
        }
      }
    }
  }

  google.maps.event.addDomListener(window, 'load', function() {
    initializeAutocomplete('city_search');
    initializeAutocomplete("sight_search");

  });
}

export { autocomplete };




