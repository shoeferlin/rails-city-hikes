

function rating() {
  $(document).ready(function() {
      $('#review_rating').barrating({
        theme: 'bootstrap-stars'
      });
   });
}

rating()

global.rating = rating
