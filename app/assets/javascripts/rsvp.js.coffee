jQuery ($) ->
  $('.conditional-form input').prop( "disabled", true )
  $('select').change (object) ->
    $('.conditional-form input').prop( "disabled", true )
    vals = $(":selected")
    for i in vals
      if (i.value == "1")
        $('.conditional-form input').prop( "disabled", false )
        break
    return

  $('select').change (object) ->
    row_user_id = object.currentTarget.id.split("-")[1]
    if object.currentTarget.value == "0"
      $(".conditional-row input#user-"+row_user_id+"-dr-field").prop( "disabled", true )
      $(".conditional-row input#user-"+row_user_id+"-age-field").prop( "disabled", true )
      $(".conditional-row input#user-"+row_user_id+"-dr-field").prop("value", '')
      $(".conditional-row input#user-"+row_user_id+"-age-field").prop("value", '')
    else if object.currentTarget.value == "1"
      $(".conditional-row input#user-"+row_user_id+"-dr-field").prop( "disabled", false )
      if $(".conditional-row input#user-"+row_user_id+"-age-field").data('child')
        $(".conditional-row input#user-"+row_user_id+"-age-field").prop( "disabled", false )
    return