

// JavaScript AutoComplete for Geocoding
import GMaps from 'gmaps/gmaps.js';

function autocomplete() {

  function initializeAutocomplete(id) {

    // Restrict city options
    const currentCity = document.getElementById("current_city");
    if (currentCity && currentCity.innerHTML != "") {
      var options = {
        componentRestrictions: {country: currentCity.innerText}
       };
    }
    var element = document.getElementById(id);
    if (element) {
      console.log(currentCity)
      if (currentCity.innerHTML != "") {
        var autocomplete = new google.maps.places.Autocomplete(element, options, { types: ['geocode'] });
      }
      else {
        var autocomplete = new google.maps.places.Autocomplete(element, options, { types: ['geocode'] });
      }
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    }
  }

  function onPlaceChanged() {

    var place = this.getPlace();
    const currentCity = document.getElementById("current_city");
    // debugger
    // console.log(place);  // Uncomment this line to view the full object returned by Google API.

    // FOR CITIES - STORE COUNTRY CODE AND CITY
      for (var i in place.address_components) {
        var component = place.address_components[i];
        for (var j in component.types) {  // Some types are ["country", "political"]
          var type_element = document.getElementById("city_" + component.types[j]);
          if (type_element) {
            type_element.value = component.short_name;
          }
        }
      }

    // FOR SIGHTS
    if (currentCity.innerHTML != "") {
      // - STORE NAME
      var type_name = document.getElementById("sight_name");
      type_name.value = place.name;
      // console.log(type_name);

      // - STORE PLACE ID
      var type_place_id = document.getElementById("sight_place_id")
      type_place_id.value = place.place_id
      // console.log(type_place_id)

      // - STORE URL
      var type_url = document.getElementById("sight_url");
      type_url.value = place.url;
      // console.log(type_url);

      // - STORE website
      var type_website = document.getElementById("sight_website")
      type_website.value = place.website
      // console.log(type_website)

      // - STORE formatted_address
      var type_formatted_address = document.getElementById("sight_formatted_address")
      type_formatted_address.value = place.formatted_address
      // console.log(type_formatted_address)

      // List items from Search result
      const list = document.querySelector("#results");
      console.log(list.innerText)
        list.insertAdjacentHTML("afterbegin", `<li id="searchfor">${type_name.value}</li>`);
        // list.insertAdjacentHTML("beforeend", `<li><a href="${type_url.value}">${type_url.value}</a></li>`);
        list.insertAdjacentHTML("beforeend", `<li>${type_formatted_address.value}</li>`);
        if (type_website.value) {
          // console.log(type_website.value)
          list.insertAdjacentHTML("beforeend", `<p><a href="${type_website.value}" class="btn btn-primary">Link to homepage</a></p>`)
        };
      }
  }

  google.maps.event.addDomListener(window, 'load', function() {
    initializeAutocomplete('city_search');
    initializeAutocomplete('sight_search');
  });
}

autocomplete();
export { autocomplete };



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

 // outputs.forEach((output) => {
 //        listitems.insertAdjacentHTML("afterbegin", `<li>${output}</li>`);
 //      });


