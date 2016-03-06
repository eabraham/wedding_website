$(document).ready ->
  introJs().start();

  $('.slideshow').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1
    variableWidth: false
    autoplay: true
    autoplaySpeed: 3000
  })
  return
