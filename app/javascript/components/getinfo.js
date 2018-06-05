
var searchFor = document.getElementById("sight_search");

function infotext() {

  // console.log(searchFor)

  // if (searchFor.innerHTML != "") {
  //   const infobox = document.querySelector("#infotext");
  //   info = searchFor.innerHTML
  //   infobox.insertAdjacentHTML("afterbegin", `<p>${info}</p>`);
  // }


  searchFor.addEventListener('blur', function (event) {
    // console.log(`Function by ${searchFor}`)

    const list = document.querySelector("#infotext");
    const listhead = document.querySelector("#infoheadline");

    fetch("/routes/1/fetch_wikipedia_data")
      .then(response => response )
      .then((data) => {
        console.log(data);
        // listhead.innerHTML = "<h4>${data.sight.name}</h4>";
        // list.insertAdjacentHTML("beforeend", `<p>${data.sight.description}</p>`);
        // list.insertAdjacentHTML("beforeend", `<a href="<%= @data.sight.picture_url%>" class="btn btn-primary">More Info</a>`);
      });
  });
}


if (searchFor) {
  infotext();
}

