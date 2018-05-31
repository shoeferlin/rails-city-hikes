
function infotext() {

var search_for = document.getElementById("hidden_infotext")
console.log(search_for)

if (search_for.innerHTML != "") {
  const infobox = document.querySelector("#infotext");
  info = search_for.innerHTML
  infobox.insertAdjacentHTML("afterbegin", `<p>${info}</p>`);
}

}

infotext()
