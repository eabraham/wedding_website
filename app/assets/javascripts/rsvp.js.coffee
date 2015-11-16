jQuery ($) ->
  $('.conditional-form input').prop( "disabled", true )
  $('input').change (object) ->
    if $('input:checked').length == 0
      $('.conditional-form input').prop( "disabled", true )
    else
      $('.conditional-form input').prop( "disabled", false )
    return