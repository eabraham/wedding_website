$(document).ready ->
  $('.slideshow').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1
    centerMode: true
    dots: true
    variableWidth: true
    autoplay: true
    autoplaySpeed: 3000
  })
  return
