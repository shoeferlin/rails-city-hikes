function changeNavbarScroll() {
  console.log(window.scrollY)
  const navbar = document.querySelector(".navbar-wagon");
  if(window.scrollY > 693) {
    navbar.classList.add("navbar-solid")
  } else {
    navbar.classList.remove("navbar-solid")
  }
}

window.addEventListener("scroll", changeNavbarScroll);

export default changeNavbarScroll;


