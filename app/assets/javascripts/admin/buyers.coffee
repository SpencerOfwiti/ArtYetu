# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  buyerDataTable = $('#buyerDataTable').dataTable
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
      url: $('#buyerDataTable').data('source')
    pagingType: 'simple_numbers'
    columns: [
      {data: 'id'}
      {data: 'buyer_first_name'}
      {data: 'buyer_last_name'}
      {data: 'buyer_email'}
      {data: 'buyer_phone_number'}
    ]