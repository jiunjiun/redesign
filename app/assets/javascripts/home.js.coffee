# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  initialize = ->
    $('button#star').closest('form').on 'ajax:success', (e, data, status, xhr) ->
      if data.status is 'star'
        $('button#star').addClass('btn-success').removeClass('btn-default')
        $('span#star_count').html( parseInt($('span#star_count').html()) + 1)
      else
        $('button#star').addClass('btn-default').removeClass('btn-success')
        $('span#star_count').html( parseInt($('span#star_count').html()) - 1)

    $("input#css_link").on "click", ->
      $(this).select()
      return

    $(".code").each ->
      code = $("#css_code").val()
      $('.hide').remove()
      CodeMirror this,
        readOnly   : true
        value      : code

        mode        : "css"
        # theme       : "monokai"
        lineNumbers : true
        lineWrapping: true
        tabSize     : 2
        tabindex    : 0
        keyMap      : "sublime"
      return


  $(document).ready(initialize)
  $(document).on('page:load', initialize)