// JavaScript AutoComplete for Geocoding

function autocomplete() {
  console.log("JS autocomplete active")
  document.addEventListener("DOMContentLoaded", function() {
    var userAddress = document.getElementById('city_name');

    if (userAddress) {
      var autocomplete = new google.maps.places.Autocomplete(userAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(userAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
