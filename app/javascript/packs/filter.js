
function filterTime() {

  const timeInfo = document.getElementById("timevar")
  const time = document.getElementById("time")

  timeInfo.innerHTML = `${time.value} min`

  time.addEventListener("click", displayDate);
  function displayDate() {
    timeInfo.innerHTML = `${time.value} min`
  }
}

function filterDistance() {

  const distanceInfo = document.getElementById("distancevar")
  const distance = document.getElementById("distance")

  distanceInfo.innerHTML = `${distance.value} km`

  distance.addEventListener("click", displayDate);
  function displayDate() {
    distanceInfo.innerHTML = `${distance.value} km`
  }

}

filterTime();
filterDistance();
