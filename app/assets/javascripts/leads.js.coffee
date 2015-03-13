$ ->
  $('.datepicker').datepicker()
  $('.select2').select2()

  $('#all_business_entities').click ->
    if $('#all_business_entities').is ':checked'
      $('#business_entities option').prop 'selected', 'selected'
      $('#business_entities').trigger 'change'
    else
      $('#business_entities option').removeAttr 'selected'
      $('#business_entities').trigger 'change'

  $('#download_csv').click ->
    $('#filter_form').attr 'action', '/leads/daily.csv'
    $('#filter_form').removeAttr 'data-remote'
    $('#filter_form').submit()

  $('#submit').click ->
    $('#filter_form').attr 'action', '/leads/daily'
    $('#filter_form').attr 'data-remote', 'true'
    $('#filter_form').submit()
