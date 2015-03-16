$ ->
  $('.datepicker').datepicker()
  $('.select2').select2()

  $('#all_business_entities').click ->
    if $('#all_business_entities').is ':checked'
      $('#filter_business_entities option').prop 'selected', 'selected'
      $('#filter_business_entities').trigger 'change'
    else
      $('#filter_business_entities option').removeAttr 'selected'
      $('#filter_business_entities').trigger 'change'

  $('#download_csv').click ->
    params = '?' + $("#filter_form").serialize()
    $(this).attr 'href', $(this).attr('href') + params