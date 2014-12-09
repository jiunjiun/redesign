# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('button#star').closest('form').on 'ajax:success', (e, data, status, xhr) ->
    if data.status is 'star'
      $('button#star').addClass('btn-success').removeClass('btn-default')
      $('span#star_count').html( parseInt($('span#star_count').html()) + 1)
    else
      $('button#star').addClass('btn-default').removeClass('btn-success')
      $('span#star_count').html( parseInt($('span#star_count').html()) - 1)