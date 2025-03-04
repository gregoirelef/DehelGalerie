const GaleryMenu = document.getElementById("galery-menu");
const dropdownMenu = document.getElementById("dropdown-menu");

GaleryMenu.addEventListener("mouseenter",function () {
  dropdownMenu.classList.toggle("hidden");
});

dropdownMenu.addEventListener("mouseleave",function () {
  dropdownMenu.classList.toggle("hidden");
});