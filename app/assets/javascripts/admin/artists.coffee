$ ->
  artistDataTable = $('#artistDataTable').dataTable
    keys: !0
    language: paginate:
      previous: '<i class=\'mdi mdi-chevron-left\'>'
      next: '<i class=\'mdi mdi-chevron-right\'>'
    drawCallback: ->
      $('.dataTables_paginate > .pagination').addClass 'pagination-rounded'
      $('.first.paginate_button, .last.paginate_button').hide()
    processing: true
    serverSide: true
    ajax:
      url: $('#artistDataTable').data('source')
    pagingType: 'simple_numbers'
    columns: [
      {data: 'id'}
      {data: 'artist_first_name'}
      {data: 'artist_last_name'}
      {data: 'artist_email'}
      {data: 'artist_phone_number'}
    ]