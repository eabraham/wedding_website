$(document).ready ->
  #debugger
  if (window.location.pathname == '/')
    introJs().setOption('showBullets', false)
             .setOption('showButtons',false)
             .setOption('tooltipPosition','left')
             .setOption('showStepNumbers', false)
             .start()

  $('.slideshow').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1
    variableWidth: false
    autoplay: true
    autoplaySpeed: 3000
  })
  return
