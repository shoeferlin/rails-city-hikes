
function infotext() {

  var search_for = document.getElementById("sight_search")
  // console.log(search_for)

  // if (search_for.innerHTML != "") {
  //   const infobox = document.querySelector("#infotext");
  //   info = search_for.innerHTML
  //   infobox.insertAdjacentHTML("afterbegin", `<p>${info}</p>`);
  // }

  search_for.addEventListener('blur', function (event) {
    // console.log(`Function by ${search_for}`)

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



infotext()
