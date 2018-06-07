
function filterTime() {

  const timeInfo = document.getElementById("timevar")
  const time = document.getElementById("time")

  if (time != "undefined") {
    timeInfo.innerHTML = `${time.value} min`
    time.addEventListener("click", displayDate);
    function displayDate() {
      timeInfo.innerHTML = `${time.value} min`
      timeInfo.style.color = "black";
    }
  }
}

function filterDistance() {

  const distanceInfo = document.getElementById("distancevar")
  const distance = document.getElementById("distance")

  distanceInfo.innerHTML = `${distance.value} km`

  distance.addEventListener("click", displayDate);
  function displayDate() {
    distanceInfo.innerHTML = `${distance.value} km`
    distanceInfo.style.color = "black";
  }

}

filterTime();
filterDistance();
