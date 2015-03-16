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
    if is_filter_valid()
      params = '?' + $("#filter_form").serialize()
      $(this).attr 'href', $(this).attr('href') + params
    else
      $('#invalid').show()
      $(document).scrollTop(0)
      false


  is_filter_valid = ->
    unless $('#filter_business_entities').val() || $('#filter_leads_sources').val()
      false
    else
      if $('#filter_date_from').val() is "" || $('#filter_date_to').val() is ""
        false
      else
        true