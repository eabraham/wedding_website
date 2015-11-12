$(document).ready ->
  $('.slideshow').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1
    variableWidth: true
    autoplay: true
    autoplaySpeed: 3000
  })
  return
