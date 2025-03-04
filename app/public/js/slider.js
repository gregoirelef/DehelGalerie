const slider=document.getElementById("slider");
const btnSliderRight=document.getElementById("scrollRight");
const btnSliderLeft=document.getElementById("scrollLeft");

btnSliderRight.addEventListener("click",function () {
  slider.scrollBy({ left: 300, behavior: 'smooth' });
});

btnSliderLeft.addEventListener("click",function () {
  slider.scrollBy({ left:-300, behavior: 'smooth' });
});