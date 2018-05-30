function changeNavbarScroll() {
  console.log(window.scrollY)
  const navbar = document.querySelector(".navbar-wagon");
  if(window.scrollY > 693) {
    navbar.classList.add("navbar-solid") && navbar.classList.add("navbar-solid")
  } else {
    navbar.classList.remove("navbar-solid")
  }
}

window.addEventListener("scroll", changeNavbarScroll);

export default changeNavbarScroll;



function changeNavbarFontScroll() {
  console.log(window.scrollY)
  const navbar = document.querySelector(".navbar-wagon");
  if(window.scrollY > 693) {
    navbar.classList.add("navbar-solid")
  } else {
    navbar.classList.remove("navbar-solid")
  }
}


